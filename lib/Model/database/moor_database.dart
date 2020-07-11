import 'package:moor_flutter/moor_flutter.dart';
import 'package:shooting_app/Model/login/local/userlog_dao.dart';
import 'package:shooting_app/Model/login/local/userlog_table.dart';
import 'package:shooting_app/screens/profile/model_profile/profile_table.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [UserLogTables, ProfileTables], daos: [UserLogDao])
class AppDatabase extends _$AppDatabase {
  // Singleton Pattern
  AppDatabase._internal() : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite', logStatements: true));
  static final _instance = AppDatabase._internal();

  factory AppDatabase() => _instance;

  @override
  int get schemaVersion => 1;
}