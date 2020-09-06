import 'package:flutter/cupertino.dart';
import 'package:shooting_app/Model/profile/profileServices.dart';

class FirstLoginController extends ChangeNotifier {
  String profileName = "";

  String motherName = "";
  String fatherName = "";
  String profilePhoto = "";
  String profileGender = "";
  String profileDob = "";
  String profileNationality = "";
  String profileOccupation = "";
  String profileQual = "";
  String recoveryEmail = "";
  String secondaryMobnum = "";
  String organization = "";
  String createdBy = "";
  String houseNo = "";
  String Locality = "";
  String Landmark = "";
  String City = "";
  String State = "";
  String Postalcode = "";

  final _profileServices = ProfileServices();

  Future updateProfile() async {
    try {
      await _profileServices.updateProfile(
          profileName: profileName,
          motherName: motherName,
          fatherName: fatherName,
          profilePhoto: profilePhoto,
          profileGender: profileGender,
          profileDob: profileDob,
          profileNationality: profileNationality,
          profileOccupation: profileOccupation,
          profileQual: profileQual,
          recoveryEmail: recoveryEmail,
          secondaryMobnum: secondaryMobnum,
          organization: organization,
          createdBy: createdBy,
          houseNo: houseNo,
          Locality: Locality,
          Landmark: Landmark,
          City: City,
          State: State,
          PostalCode: Postalcode);
      await _profileServices.addProfiletoDatabase();
    } catch (e) {}
  }

  void validateEmail() {}

  void validateMobnum() {}

  void validatePostalCode() {}
}
