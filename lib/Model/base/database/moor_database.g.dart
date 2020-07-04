// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserLogTable extends DataClass implements Insertable<UserLogTable> {
  final int userType;
  final String Name;
  final String email;

  UserLogTable(
      {@required this.userType, @required this.Name, @required this.email});

  factory UserLogTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return UserLogTable(
      userType:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_type']),
      Name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userType != null) {
      map['user_type'] = Variable<int>(userType);
    }
    if (!nullToAbsent || Name != null) {
      map['name'] = Variable<String>(Name);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    return map;
  }

  UserLogTablesCompanion toCompanion(bool nullToAbsent) {
    return UserLogTablesCompanion(
      userType: userType == null && nullToAbsent
          ? const Value.absent()
          : Value(userType),
      Name: Name == null && nullToAbsent ? const Value.absent() : Value(Name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
    );
  }

  factory UserLogTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserLogTable(
      userType: serializer.fromJson<int>(json['userType']),
      Name: serializer.fromJson<String>(json['Name']),
      email: serializer.fromJson<String>(json['email']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userType': serializer.toJson<int>(userType),
      'Name': serializer.toJson<String>(Name),
      'email': serializer.toJson<String>(email),
    };
  }

  UserLogTable copyWith({int userType, String Name, String email}) =>
      UserLogTable(
        userType: userType ?? this.userType,
        Name: Name ?? this.Name,
        email: email ?? this.email,
      );

  @override
  String toString() {
    return (StringBuffer('UserLogTable(')
          ..write('userType: $userType, ')
          ..write('Name: $Name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(userType.hashCode, $mrjc(Name.hashCode, email.hashCode)));

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UserLogTable &&
          other.userType == this.userType &&
          other.Name == this.Name &&
          other.email == this.email);
}

class UserLogTablesCompanion extends UpdateCompanion<UserLogTable> {
  final Value<int> userType;
  final Value<String> Name;
  final Value<String> email;

  const UserLogTablesCompanion({
    this.userType = const Value.absent(),
    this.Name = const Value.absent(),
    this.email = const Value.absent(),
  });

  UserLogTablesCompanion.insert({
    @required int userType,
    @required String Name,
    @required String email,
  })  : userType = Value(userType),
        Name = Value(Name),
        email = Value(email);

  static Insertable<UserLogTable> custom({
    Expression<int> userType,
    Expression<String> Name,
    Expression<String> email,
  }) {
    return RawValuesInsertable({
      if (userType != null) 'user_type': userType,
      if (Name != null) 'name': Name,
      if (email != null) 'email': email,
    });
  }

  UserLogTablesCompanion copyWith(
      {Value<int> userType, Value<String> Name, Value<String> email}) {
    return UserLogTablesCompanion(
      userType: userType ?? this.userType,
      Name: Name ?? this.Name,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userType.present) {
      map['user_type'] = Variable<int>(userType.value);
    }
    if (Name.present) {
      map['name'] = Variable<String>(Name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserLogTablesCompanion(')
          ..write('userType: $userType, ')
          ..write('Name: $Name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $UserLogTablesTable extends UserLogTables
    with TableInfo<$UserLogTablesTable, UserLogTable> {
  final GeneratedDatabase _db;
  final String _alias;

  $UserLogTablesTable(this._db, [this._alias]);

  final VerificationMeta _userTypeMeta = const VerificationMeta('userType');
  GeneratedIntColumn _userType;

  @override
  GeneratedIntColumn get userType => _userType ??= _constructUserType();

  GeneratedIntColumn _constructUserType() {
    return GeneratedIntColumn(
      'user_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _NameMeta = const VerificationMeta('Name');
  GeneratedTextColumn _Name;

  @override
  GeneratedTextColumn get Name => _Name ??= _constructName();

  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;

  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();

  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [userType, Name, email];

  @override
  $UserLogTablesTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'user_log_tables';
  @override
  final String actualTableName = 'user_log_tables';

  @override
  VerificationContext validateIntegrity(Insertable<UserLogTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_type')) {
      context.handle(_userTypeMeta,
          userType.isAcceptableOrUnknown(data['user_type'], _userTypeMeta));
    } else if (isInserting) {
      context.missing(_userTypeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _NameMeta, Name.isAcceptableOrUnknown(data['name'], _NameMeta));
    } else if (isInserting) {
      context.missing(_NameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {email};

  @override
  UserLogTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UserLogTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UserLogTablesTable createAlias(String alias) {
    return $UserLogTablesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UserLogTablesTable _userLogTables;

  $UserLogTablesTable get userLogTables =>
      _userLogTables ??= $UserLogTablesTable(this);
  UserLogDao _userLogDao;

  UserLogDao get userLogDao => _userLogDao ??= UserLogDao(this as AppDatabase);

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userLogTables];
}
