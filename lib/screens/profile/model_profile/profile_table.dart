import 'package:moor_flutter/moor_flutter.dart';

class ProfileTables extends Table {
  TextColumn get motherName => text()();
  TextColumn get fatherName => text()();
  TextColumn get profilePhoto => text()();
  TextColumn get profileGender => text()();
  TextColumn get profileDob => text()();
  TextColumn get profileNationality => text()();
  TextColumn get profileOccupation => text()();
  TextColumn get profileQual => text()();
  TextColumn get recoveryEmail => text()();
  TextColumn get secondaryMobnum => text()();
  TextColumn get organization => text()();
  TextColumn get createdBy => text()();
  IntColumn get houseNo => integer()();
  TextColumn get locality => text()();
  TextColumn get landmark => text()();
  TextColumn get city => text()();
  TextColumn get state => text()();
  IntColumn get postalCode => integer()();

  @override
  Set<Column> get primaryKey => {recoveryEmail};
}