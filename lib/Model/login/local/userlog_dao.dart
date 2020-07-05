import 'package:moor_flutter/moor_flutter.dart';
import 'package:shooting_app/Model/database/moor_database.dart';
import 'package:shooting_app/Model/login/local/userlog_table.dart';

part 'userlog_dao.g.dart';

@UseDao(tables: [UserLogTables])
class UserLogDao extends DatabaseAccessor<AppDatabase> with _$UserLogDaoMixin {
  UserLogDao(AppDatabase db) : super(db);

  Future<List<UserLogTable>> get userLog => select(userLogTables).get();

  Future insertUserLog(UserLogTable userLogTable) =>
      into(userLogTables).insertOnConflictUpdate(userLogTable);

  Future clearUserLog() => delete(userLogTables).go();
}
