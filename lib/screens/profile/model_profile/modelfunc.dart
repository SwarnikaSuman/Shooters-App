import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shooting_app/Model/base/CustomNetworkCliet.dart';
import 'package:shooting_app/Model/base/ExceptionClasses.dart';
import 'package:shooting_app/Model/database/moor_database.dart';
import 'package:shooting_app/screens/profile/model_profile/profile_dao.dart';
import 'package:shooting_app/screens/profile/model_profile/profile_table.dart';
import 'package:shooting_app/screens/values/Strings.dart';

class ManageProfile {
  final CustomNetworkClient _customNetworkClient = CustomNetworkClient();
  ProfileDao profileDao;

  Future<bool> registerProfile({
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
    @required int houseNo,
    @required String locality,
    @required String landmark,
    @required String city,
    @required String state,
    @required int postalCode,
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
      'Locality': locality,
      'Landmark': landmark,
      'City': city,
      'State': state,
      'Postalcode': postalCode,
    };
    Response response = await _customNetworkClient.POST(
      url: '/users/addprofile',
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Map<String, String> registerObject = jsonDecode(response.body);
      if (registerObject['message'] == "success") {
        return true;
      }
      return false;
    } else {
      throw HttpException(response.statusCode);
    }
  }

  void addProfiletoDatabase() {
    final profile = ProfileTable(
      motherName: "",
      fatherName: "",
      recoveryEmail: "",
      organization: "",
      createdBy: "",
      houseNo: 1,
      locality: "",
      landmark: "",
      city: "",
      postalCode: 1,
      profileDob: "",
      profileGender: "",
      profileNationality: "",
      profileOccupation: "",
      profilePhoto: "",
      profileQual: "",
      secondaryMobnum: "",
      state: "",
    );
    profileDao.insertProfile(profile);
  }
}
