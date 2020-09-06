class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class GetProfile {
  String profileName;
  String modifiedOn;
  String modifiedBy;
  String role;
  String profileEmail;
  String profileMobnum;
  String createdOn;
  int isActive;
  int profileType;
  int isApproved;
  int addressId;
  String addressEmail;
  String motherName;
  String fatherName;
  String profilePhoto;
  String profileGender;
  String profileDob;
  String profileNationality;
  String profileOccupation;
  String profileQual;
  String recoveryEmail;
  String secondaryMobnum;
  String organization;
  String createdBy;
  int houseNo;
  String locality;
  String landmark;
  String city;
  String state;
  int postalCode;

  GetProfile(
      {this.city,
      this.createdBy,
      this.fatherName,
      this.houseNo,
      this.landmark,
      this.locality,
      this.motherName,
      this.organization,
      this.postalCode,
      this.profileDob,
      this.profileGender,
      this.profileNationality,
      this.profileOccupation,
      this.profilePhoto,
      this.profileQual,
      this.recoveryEmail,
      this.secondaryMobnum,
      this.state,
      this.addressEmail,
      this.addressId,
      this.createdOn,
      this.isActive,
      this.isApproved,
      this.modifiedBy,
      this.modifiedOn,
      this.profileEmail,
      this.profileMobnum,
      this.profileName,
      this.profileType,
      this.role});

  factory GetProfile.fromJson(Map<String, dynamic> json) {
    return GetProfile(
      profileName: json['results']['profileName'],
      modifiedOn: json['results']['modifiedOn'],
      modifiedBy: json['results']['modifiedBy'],
      role: json['results']['Role'],
      profileEmail: json['results']['profileEmail'],
      profileMobnum: json['results']['profileMobnum'],
      createdOn: json['results']['createdOn'],
      isActive: json['results']['isActive'],
      profileType: json['results']['profileType'],
      isApproved: json['results']['isApproved'],
      addressId: json['results']['addressId'],
      addressEmail: json['results']['addressEmail'],
      motherName: json['results']['motherName'],
      fatherName: json['results']['fatherName'],
      recoveryEmail: json['results']['recoveryEmail'],
      organization: json['results']['Oraganization'],
      createdBy: json['results']['createdBy'],
      houseNo: json['results']['houseNo'],
      locality: json['results']['Locality'],
      landmark: json['results']['Landmark'],
      city: json['results']['City'],
      postalCode: json['results']['Postalcode'],
      profileDob: json['results']['profileDob'],
      profileGender: json['results']['profileGender'],
      profileNationality: json['results']['profileNationality'],
      profileOccupation: json['results']['profileOccupation'],
      profilePhoto: json['results']['profilePhoto'],
      profileQual: json['results']['profileQual'],
      secondaryMobnum: json['results']['secondaryMobnum'],
      state: json['results']['State'],
    );
  }
}
