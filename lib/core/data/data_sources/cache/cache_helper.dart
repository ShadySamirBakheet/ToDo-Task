abstract class CacheHelper {
  String? getString(String key);
  int? getint(String key);
  double? getDouble(String key);
  List? getList(String key);
  Map? getMap(String key);
  DateTime? getDateTime(String key);

  void setString({required String key, required String value});
  void setint({required String key, required int value});
  void setDouble({required String key, required double value});
  void setList({required String key, required List value});
  void setMap({required String key, required Map value});
  void setDateTime({required String key, required DateTime value});
}
