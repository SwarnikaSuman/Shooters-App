import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shooting_app/Model/base/CustomNetworkCliet.dart';
import 'package:shooting_app/Model/base/ExceptionClasses.dart';
import 'package:shooting_app/Model/database/moor_database.dart';
import 'package:shooting_app/Model/profile/local/profile_dao.dart';
import 'package:shooting_app/Model/profile/profilejson_converter.dart';

class ProfileServices {
  final CustomNetworkClient _customNetworkClient = CustomNetworkClient();
  final ProfileDao _profileDao = AppDatabase().profileDao;

  Future<void> updateProfile({
    @required String profileName,
    @required String motherName,
    @required String fatherName,
    @required String profilePhoto,
    @required String profileGender,
    @required String profileDob,
    @required String profileNationality,
    @required String profileOccupation,
    @required String profileQual,
    @required String recoveryEmail,
    @required String secondaryMobnum,
    @required String organization,
    @required String createdBy,
    @required String houseNo,
    @required String Locality,
    @required String Landmark,
    @required String City,
    @required String State,
    @required String PostalCode,
  }) async {
    Map<String, dynamic> body = {
      'motherName': motherName,
      'fatherName': fatherName,
      'profilePhoto': profilePhoto,
      'profileGender': profileGender,
      'profileDob': profileDob,
      'profileNationality': profileNationality,
      'profileOccupation': profileOccupation,
      'profileQual': profileQual,
      'recoveryEmail': recoveryEmail,
      'secondaryMobnum': secondaryMobnum,
      'organization': organization,
      'createdBy': createdBy,
      'houseNo': houseNo,
      'Locality': Locality,
      'Landmark': Landmark,
      'City': City,
      'State': State,
      'Postalcode': PostalCode,
    };
    Response response = await _customNetworkClient.POST(
      url: '/users/addprofile',
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Map<String, String> profileObject = jsonDecode(response.body);
      if (profileObject['message'] != "success") {
        throw NotSuccessException(profileObject['message']);
      }
    } else {
      throw HttpException(response.statusCode);
    }
  }

  Future<void> addProfiletoDatabase() async {
    Response response = await _customNetworkClient.GET(
      url: '/users/showprofile',
    );
    if (response.statusCode == 200) {
      //This takes response and maps it onto a profile model
      GetProfile profile = GetProfile.fromJson(json.decode(response.body));

      //This profileData is an object of table and reads values from the profile model
      final profileData = ProfileTable(
        profileName: profile.profileName,
        modifiedOn: profile.modifiedOn,
        modifiedBy: profile.modifiedBy,
        role: profile.role,
        profileEmail: profile.profileEmail,
        profileMobnum: profile.profileMobnum,
        createdOn: profile.createdOn,
        isActive: profile.isActive,
        profileType: profile.profileType,
        isApproved: profile.isApproved,
        addressId: profile.addressId,
        addressEmail: profile.addressEmail,
        motherName: profile.motherName,
        fatherName: profile.fatherName,
        recoveryEmail: profile.recoveryEmail,
        organization: profile.organization,
        createdBy: profile.createdBy,
        houseNo: profile.houseNo,
        locality: profile.locality,
        landmark: profile.landmark,
        city: profile.city,
        postalCode: profile.postalCode,
        profileDob: profile.profileDob,
        profileGender: profile.profileGender,
        profileNationality: profile.profileNationality,
        profileOccupation: profile.profileOccupation,
        profilePhoto: profile.profilePhoto,
        profileQual: profile.profileQual,
        secondaryMobnum: profile.secondaryMobnum,
        state: profile.state,
      );
      await _profileDao.insertProfile(profileData);
    } else {
      throw HttpException(response.statusCode);
    }
  }

  Stream<ProfileTable> observeProfile() {
    return _profileDao.userProfile;
  }
}
