import 'package:flutter/cupertino.dart';
import 'package:shooting_app/Model/profile/profileServices.dart';

class FirstLoginController extends ChangeNotifier {
  String profileName = "";

  //Personal
  String profilePhoto = "";
  String profileGender = "";
  String profileDob = "";
  String motherName = "";
  String fatherName = "";
  String profileNationality = "";
  String profileOccupation = "";
  String organization = "";
  String profileQual = "";

  //Address
  String houseNo = "";
  String Locality = "";
  String Landmark = "";
  String City = "";
  String State = "";
  String Postalcode = "";

  // Contact
  String recoveryEmail = "";
  String secondaryMobnum = "";

  String createdBy = "";

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
