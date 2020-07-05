import 'package:moor_flutter/moor_flutter.dart';

class UserLogTables extends Table {
  IntColumn get userType => integer()();

  TextColumn get Name => text()();

  TextColumn get email => text()();

  @override
  Set<Column> get primaryKey => {email};
}
