import 'package:moor_flutter/moor_flutter.dart';
import 'package:shooting_app/Model/database/moor_database.dart';
import 'package:shooting_app/Model/profile/local/profile_table.dart';

part 'profile_dao.g.dart';

@UseDao(tables: [ProfileTables])
class ProfileDao extends DatabaseAccessor<AppDatabase> with _$ProfileDaoMixin {
  ProfileDao(AppDatabase db) : super(db);

  Stream<ProfileTable> get userProfile => select(profileTables).watchSingle();

  Future insertProfile(ProfileTable profileTable) =>
      into(profileTables).insertOnConflictUpdate(profileTable);

  Future clearProfile() => delete(profileTables).go();
}
