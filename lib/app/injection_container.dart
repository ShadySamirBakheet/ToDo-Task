import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/core/data/data_sources/local_database/drift_database.dart';
import 'package:todo/modules/todo/data/datasources/local_datasource/todo_local_datasource.dart';
import 'package:todo/modules/todo/data/datasources/local_datasource/todo_local_datasource_impl.dart';
import 'package:todo/modules/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo/modules/todo/domain/repositories/todo_repository.dart';
import 'package:todo/modules/todo/domain/usecases/add_note_case.dart';
import 'package:todo/modules/todo/domain/usecases/delete_all_notes_case.dart';
import 'package:todo/modules/todo/domain/usecases/delete_note_case.dart';
import 'package:todo/modules/todo/domain/usecases/select_note_case.dart';
import 'package:todo/modules/todo/domain/usecases/select_notes_case.dart';
import 'package:todo/modules/todo/domain/usecases/upate_note_case.dart';
import 'package:todo/modules/user/data/datasources/cache_source/user_cache_source.dart';
import 'package:todo/modules/user/data/datasources/cache_source/user_cache_source_impl.dart';
import 'package:todo/modules/user/data/datasources/local_datasource/user_local_datasource.dart';
import 'package:todo/modules/user/data/datasources/local_datasource/user_local_datasource_impl.dart';

import 'package:todo/modules/user/data/models/user_model_cache.dart';
import 'package:todo/modules/user/data/repositories/user_repository_impl.dart';
import 'package:todo/modules/user/domain/repositories/user_repository.dart';
import 'package:todo/modules/user/domain/usecases/check_user_auth.dart';
import 'package:todo/modules/user/domain/usecases/login_user.dart';
import 'package:todo/modules/user/domain/usecases/user_sign_out.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(UserAdapter());

  // database
  sl
    ..registerLazySingleton<AppDatabase>(AppDatabase.new)

    // datasource local
    ..registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(
        sl(),
      ),
    )
    ..registerLazySingleton<ToDoLocalDataSource>(
      () => ToDoLocalDataSourceImpl(
        sl(),
      ),
    )

    // datasource cache

    ..registerLazySingleton<UserCacheSource>(
      UserCacheSourceImpl.new,
    )

    //repository
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        cacheSource: sl(),
        localDataSource: sl(),
      ),
    )
    ..registerLazySingleton<ToDoRepository>(
      () => ToDoRepositoryImpl(
        localDataSource: sl(),
      ),
    )

    //uses case // ! user
    ..registerLazySingleton<CheckUserAuth>(
      () => CheckUserAuth(
        repository: sl(),
      ),
    )
    ..registerLazySingleton<UserSignOut>(
      () => UserSignOut(
        repository: sl(),
      ),
    )
    ..registerLazySingleton<LoginUser>(
      () => LoginUser(
        repository: sl(),
      ),
    )
    // ! note
    ..registerLazySingleton(
      () => SelectAllNotesCase(
        repository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => SelectNoteCase(
        repository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => AddNoteCase(
        repository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteNoteCase(
        repository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteAllNoteCase(
        repository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => UpdateNoteCase(
        repository: sl(),
      ),
    );
}
