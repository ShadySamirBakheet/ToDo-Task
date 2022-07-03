import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:todo/modules/todo/data/models/todo_model.dart';
import 'package:todo/modules/user/data/models/user_model.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [Users, Notes],
  daos: [],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({QueryExecutor? sourse}) : super(sourse ?? _openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(
      file,
      logStatements: true,
    );
  });
}
