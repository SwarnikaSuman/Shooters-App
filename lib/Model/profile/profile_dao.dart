import 'package:moor_flutter/moor_flutter.dart';
import 'package:shooting_app/Model/database/moor_database.dart';
import 'package:shooting_app/Model/profile/profile_table.dart';

part 'profile_dao.g.dart';

@UseDao(tables: [ProfileTables])
class ProfileDao extends DatabaseAccessor<AppDatabase> with _$ProfileDaoMixin {
  ProfileDao(AppDatabase db) : super(db);

  Future<List<ProfileTable>> get userProfile => select(profileTables).get();

  Future insertProfile(ProfileTable profileTable) =>
      into(profileTables).insertOnConflictUpdate(profileTable);

  Future clearProfile() => delete(profileTables).go();
}
