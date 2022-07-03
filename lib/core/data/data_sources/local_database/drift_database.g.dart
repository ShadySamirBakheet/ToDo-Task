// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class UsersCompanion extends UpdateCompanion<UsersModel> {
  final Value<int> uid;
  final Value<String> userName;
  final Value<String> userEmail;
  final Value<String> password;
  const UsersCompanion({
    this.uid = const Value.absent(),
    this.userName = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.password = const Value.absent(),
  });
  UsersCompanion.insert({
    this.uid = const Value.absent(),
    required String userName,
    required String userEmail,
    required String password,
  })  : userName = Value(userName),
        userEmail = Value(userEmail),
        password = Value(password);
  static Insertable<UsersModel> custom({
    Expression<int>? uid,
    Expression<String>? userName,
    Expression<String>? userEmail,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (userName != null) 'user_name': userName,
      if (userEmail != null) 'user_email': userEmail,
      if (password != null) 'password': password,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? uid,
      Value<String>? userName,
      Value<String>? userEmail,
      Value<String>? password}) {
    return UsersCompanion(
      uid: uid ?? this.uid,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (userEmail.present) {
      map['user_email'] = Variable<String>(userEmail.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('uid: $uid, ')
          ..write('userName: $userName, ')
          ..write('userEmail: $userEmail, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, UsersModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int?> uid = GeneratedColumn<int?>(
      'uid', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String?> userName = GeneratedColumn<String?>(
      'user_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 250),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _userEmailMeta = const VerificationMeta('userEmail');
  @override
  late final GeneratedColumn<String?> userEmail = GeneratedColumn<String?>(
      'user_email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 250),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 250),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uid, userName, userEmail, password];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UsersModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('user_email')) {
      context.handle(_userEmailMeta,
          userEmail.isAcceptableOrUnknown(data['user_email']!, _userEmailMeta));
    } else if (isInserting) {
      context.missing(_userEmailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  UsersModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersModel(
      uid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uid'])!,
      userName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name'])!,
      userEmail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_email'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class NotesCompanion extends UpdateCompanion<NotesModel> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> note;
  final Value<DateTime> timeNote;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.note = const Value.absent(),
    this.timeNote = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String note,
    required DateTime timeNote,
  })  : title = Value(title),
        note = Value(note),
        timeNote = Value(timeNote);
  static Insertable<NotesModel> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? note,
    Expression<DateTime>? timeNote,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (note != null) 'note': note,
      if (timeNote != null) 'time_note': timeNote,
    });
  }

  NotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? note,
      Value<DateTime>? timeNote}) {
    return NotesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      timeNote: timeNote ?? this.timeNote,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (timeNote.present) {
      map['time_note'] = Variable<DateTime>(timeNote.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('timeNote: $timeNote')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, NotesModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 250),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String?> note = GeneratedColumn<String?>(
      'note', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 250),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _timeNoteMeta = const VerificationMeta('timeNote');
  @override
  late final GeneratedColumn<DateTime?> timeNote = GeneratedColumn<DateTime?>(
      'time_note', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, note, timeNote];
  @override
  String get aliasedName => _alias ?? 'notes';
  @override
  String get actualTableName => 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<NotesModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('time_note')) {
      context.handle(_timeNoteMeta,
          timeNote.isAcceptableOrUnknown(data['time_note']!, _timeNoteMeta));
    } else if (isInserting) {
      context.missing(_timeNoteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotesModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotesModel(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      timeNote: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time_note'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      note: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}note'])!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  late final $NotesTable notes = $NotesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, notes];
}
