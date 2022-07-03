import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/core/data/data_sources/cache/cache_helper.dart';

class HiveCacheHelper implements CacheHelper {
  static Future<HiveCacheHelper> init() async {
    await Hive.openBox<String>(Constants.kStringHiveKey);
    await Hive.openBox<int>(Constants.kIntHiveKey);
    await Hive.openBox<double>(Constants.kDoubleHiveKey);
    await Hive.openBox<List>(Constants.kListHiveKey);
    await Hive.openBox<Map>(Constants.kMapHiveKey);
    await Hive.openBox<DateTime>(Constants.kDateTimeHiveKey);
    return HiveCacheHelper();
  }

  void _checkInitCalled(String key) {
    if (!Hive.isBoxOpen(key)) {
      throw AssertionError(
        'box is not opened you may forget to call init function',
      );
    }
  }

  @override
  DateTime? getDateTime(String key) {
    _checkInitCalled(Constants.kDateTimeHiveKey);
    return Hive.box<DateTime>(Constants.kDateTimeHiveKey).get(key);
  }

  @override
  double? getDouble(String key) {
    _checkInitCalled(Constants.kDoubleHiveKey);
    return Hive.box<double>(Constants.kDoubleHiveKey).get(key);
  }

  @override
  List? getList(String key) {
    _checkInitCalled(Constants.kListHiveKey);
    return Hive.box<List>(Constants.kListHiveKey).get(key);
  }

  @override
  Map<String, dynamic>? getMap(String key) {
    _checkInitCalled(Constants.kMapHiveKey);
    return Hive.box<Map<String, dynamic>>(Constants.kMapHiveKey).get(key);
  }

  @override
  String? getString(String key) {
    _checkInitCalled(Constants.kStringHiveKey);
    return Hive.box<String>(Constants.kStringHiveKey).get(key);
  }

  @override
  int? getint(String key) {
    _checkInitCalled(Constants.kIntHiveKey);
    return Hive.box<int>(Constants.kIntHiveKey).get(key);
  }

  @override
  void setDateTime({required String key, required DateTime value}) {
    _checkInitCalled(Constants.kDateTimeHiveKey);
    Hive.box<DateTime>(Constants.kDateTimeHiveKey).put(key, value);
  }

  @override
  void setDouble({required String key, required double value}) {
    _checkInitCalled(Constants.kDoubleHiveKey);
    Hive.box<double>(Constants.kDoubleHiveKey).put(key, value);
  }

  @override
  void setList({required String key, required List value}) {
    _checkInitCalled(Constants.kListHiveKey);
    Hive.box<List>(Constants.kListHiveKey).put(key, value);
  }

  @override
  void setMap({required String key, required Map value}) {
    _checkInitCalled(Constants.kMapHiveKey);
    Hive.box<Map>(Constants.kMapHiveKey).put(key, value);
  }

  @override
  void setString({required String key, required String value}) {
    _checkInitCalled(Constants.kStringHiveKey);
    Hive.box<String>(Constants.kStringHiveKey).put(key, value);
  }

  @override
  void setint({required String key, required int value}) {
    _checkInitCalled(Constants.kIntHiveKey);
    Hive.box<int>(Constants.kIntHiveKey).put(key, value);
  }
}
