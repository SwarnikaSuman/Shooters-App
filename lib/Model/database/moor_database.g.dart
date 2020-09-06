// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserLogTable extends DataClass implements Insertable<UserLogTable> {
  final int userType;
  final String Name;
  final String email;
  UserLogTable(
      {@required this.userType, @required this.Name, @required this.email});
  factory UserLogTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return UserLogTable(
      userType:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_type']),
      Name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userType != null) {
      map['user_type'] = Variable<int>(userType);
    }
    if (!nullToAbsent || Name != null) {
      map['name'] = Variable<String>(Name);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    return map;
  }

  UserLogTablesCompanion toCompanion(bool nullToAbsent) {
    return UserLogTablesCompanion(
      userType: userType == null && nullToAbsent
          ? const Value.absent()
          : Value(userType),
      Name: Name == null && nullToAbsent ? const Value.absent() : Value(Name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
    );
  }

  factory UserLogTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserLogTable(
      userType: serializer.fromJson<int>(json['userType']),
      Name: serializer.fromJson<String>(json['Name']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userType': serializer.toJson<int>(userType),
      'Name': serializer.toJson<String>(Name),
      'email': serializer.toJson<String>(email),
    };
  }

  UserLogTable copyWith({int userType, String Name, String email}) =>
      UserLogTable(
        userType: userType ?? this.userType,
        Name: Name ?? this.Name,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('UserLogTable(')
          ..write('userType: $userType, ')
          ..write('Name: $Name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(userType.hashCode, $mrjc(Name.hashCode, email.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UserLogTable &&
          other.userType == this.userType &&
          other.Name == this.Name &&
          other.email == this.email);
}

class UserLogTablesCompanion extends UpdateCompanion<UserLogTable> {
  final Value<int> userType;
  final Value<String> Name;
  final Value<String> email;
  const UserLogTablesCompanion({
    this.userType = const Value.absent(),
    this.Name = const Value.absent(),
    this.email = const Value.absent(),
  });
  UserLogTablesCompanion.insert({
    @required int userType,
    @required String Name,
    @required String email,
  })  : userType = Value(userType),
        Name = Value(Name),
        email = Value(email);
  static Insertable<UserLogTable> custom({
    Expression<int> userType,
    Expression<String> Name,
    Expression<String> email,
  }) {
    return RawValuesInsertable({
      if (userType != null) 'user_type': userType,
      if (Name != null) 'name': Name,
      if (email != null) 'email': email,
    });
  }

  UserLogTablesCompanion copyWith(
      {Value<int> userType, Value<String> Name, Value<String> email}) {
    return UserLogTablesCompanion(
      userType: userType ?? this.userType,
      Name: Name ?? this.Name,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userType.present) {
      map['user_type'] = Variable<int>(userType.value);
    }
    if (Name.present) {
      map['name'] = Variable<String>(Name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserLogTablesCompanion(')
          ..write('userType: $userType, ')
          ..write('Name: $Name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $UserLogTablesTable extends UserLogTables
    with TableInfo<$UserLogTablesTable, UserLogTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $UserLogTablesTable(this._db, [this._alias]);
  final VerificationMeta _userTypeMeta = const VerificationMeta('userType');
  GeneratedIntColumn _userType;
  @override
  GeneratedIntColumn get userType => _userType ??= _constructUserType();
  GeneratedIntColumn _constructUserType() {
    return GeneratedIntColumn(
      'user_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _NameMeta = const VerificationMeta('Name');
  GeneratedTextColumn _Name;
  @override
  GeneratedTextColumn get Name => _Name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [userType, Name, email];
  @override
  $UserLogTablesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user_log_tables';
  @override
  final String actualTableName = 'user_log_tables';
  @override
  VerificationContext validateIntegrity(Insertable<UserLogTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_type')) {
      context.handle(_userTypeMeta,
          userType.isAcceptableOrUnknown(data['user_type'], _userTypeMeta));
    } else if (isInserting) {
      context.missing(_userTypeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _NameMeta, Name.isAcceptableOrUnknown(data['name'], _NameMeta));
    } else if (isInserting) {
      context.missing(_NameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {email};
  @override
  UserLogTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UserLogTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UserLogTablesTable createAlias(String alias) {
    return $UserLogTablesTable(_db, alias);
  }
}

class ProfileTable extends DataClass implements Insertable<ProfileTable> {
  final String motherName;
  final String fatherName;
  final String profilePhoto;
  final String profileGender;
  final String profileDob;
  final String profileNationality;
  final String profileOccupation;
  final String profileQual;
  final String recoveryEmail;
  final String secondaryMobnum;
  final String organization;
  final String createdBy;
  final int houseNo;
  final String locality;
  final String landmark;
  final String city;
  final String state;
  final int postalCode;
  final String profileName;
  final String modifiedOn;
  final String modifiedBy;
  final String role;
  final String profileEmail;
  final String profileMobnum;
  final String createdOn;
  final String addressEmail;
  final int isActive;
  final int profileType;
  final int isApproved;
  final int addressId;
  ProfileTable(
      {@required this.motherName,
      @required this.fatherName,
      @required this.profilePhoto,
      @required this.profileGender,
      @required this.profileDob,
      @required this.profileNationality,
      @required this.profileOccupation,
      @required this.profileQual,
      @required this.recoveryEmail,
      @required this.secondaryMobnum,
      @required this.organization,
      @required this.createdBy,
      @required this.houseNo,
      @required this.locality,
      @required this.landmark,
      @required this.city,
      @required this.state,
      @required this.postalCode,
      @required this.profileName,
      @required this.modifiedOn,
      @required this.modifiedBy,
      @required this.role,
      @required this.profileEmail,
      @required this.profileMobnum,
      @required this.createdOn,
      @required this.addressEmail,
      @required this.isActive,
      @required this.profileType,
      @required this.isApproved,
      @required this.addressId});
  factory ProfileTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return ProfileTable(
      motherName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mother_name']),
      fatherName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}father_name']),
      profilePhoto: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_photo']),
      profileGender: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_gender']),
      profileDob: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_dob']),
      profileNationality: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}profile_nationality']),
      profileOccupation: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}profile_occupation']),
      profileQual: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_qual']),
      recoveryEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}recovery_email']),
      secondaryMobnum: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}secondary_mobnum']),
      organization: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}organization']),
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      houseNo:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}house_no']),
      locality: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}locality']),
      landmark: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}landmark']),
      city: stringType.mapFromDatabaseResponse(data['${effectivePrefix}city']),
      state:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}state']),
      postalCode: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}postal_code']),
      profileName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_name']),
      modifiedOn: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}modified_on']),
      modifiedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}modified_by']),
      role: stringType.mapFromDatabaseResponse(data['${effectivePrefix}role']),
      profileEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_email']),
      profileMobnum: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_mobnum']),
      createdOn: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_on']),
      addressEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}address_email']),
      isActive:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}is_active']),
      profileType: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_type']),
      isApproved: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_approved']),
      addressId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}address_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || motherName != null) {
      map['mother_name'] = Variable<String>(motherName);
    }
    if (!nullToAbsent || fatherName != null) {
      map['father_name'] = Variable<String>(fatherName);
    }
    if (!nullToAbsent || profilePhoto != null) {
      map['profile_photo'] = Variable<String>(profilePhoto);
    }
    if (!nullToAbsent || profileGender != null) {
      map['profile_gender'] = Variable<String>(profileGender);
    }
    if (!nullToAbsent || profileDob != null) {
      map['profile_dob'] = Variable<String>(profileDob);
    }
    if (!nullToAbsent || profileNationality != null) {
      map['profile_nationality'] = Variable<String>(profileNationality);
    }
    if (!nullToAbsent || profileOccupation != null) {
      map['profile_occupation'] = Variable<String>(profileOccupation);
    }
    if (!nullToAbsent || profileQual != null) {
      map['profile_qual'] = Variable<String>(profileQual);
    }
    if (!nullToAbsent || recoveryEmail != null) {
      map['recovery_email'] = Variable<String>(recoveryEmail);
    }
    if (!nullToAbsent || secondaryMobnum != null) {
      map['secondary_mobnum'] = Variable<String>(secondaryMobnum);
    }
    if (!nullToAbsent || organization != null) {
      map['organization'] = Variable<String>(organization);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || houseNo != null) {
      map['house_no'] = Variable<int>(houseNo);
    }
    if (!nullToAbsent || locality != null) {
      map['locality'] = Variable<String>(locality);
    }
    if (!nullToAbsent || landmark != null) {
      map['landmark'] = Variable<String>(landmark);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<int>(postalCode);
    }
    if (!nullToAbsent || profileName != null) {
      map['profile_name'] = Variable<String>(profileName);
    }
    if (!nullToAbsent || modifiedOn != null) {
      map['modified_on'] = Variable<String>(modifiedOn);
    }
    if (!nullToAbsent || modifiedBy != null) {
      map['modified_by'] = Variable<String>(modifiedBy);
    }
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<String>(role);
    }
    if (!nullToAbsent || profileEmail != null) {
      map['profile_email'] = Variable<String>(profileEmail);
    }
    if (!nullToAbsent || profileMobnum != null) {
      map['profile_mobnum'] = Variable<String>(profileMobnum);
    }
    if (!nullToAbsent || createdOn != null) {
      map['created_on'] = Variable<String>(createdOn);
    }
    if (!nullToAbsent || addressEmail != null) {
      map['address_email'] = Variable<String>(addressEmail);
    }
    if (!nullToAbsent || isActive != null) {
      map['is_active'] = Variable<int>(isActive);
    }
    if (!nullToAbsent || profileType != null) {
      map['profile_type'] = Variable<int>(profileType);
    }
    if (!nullToAbsent || isApproved != null) {
      map['is_approved'] = Variable<int>(isApproved);
    }
    if (!nullToAbsent || addressId != null) {
      map['address_id'] = Variable<int>(addressId);
    }
    return map;
  }

  ProfileTablesCompanion toCompanion(bool nullToAbsent) {
    return ProfileTablesCompanion(
      motherName: motherName == null && nullToAbsent
          ? const Value.absent()
          : Value(motherName),
      fatherName: fatherName == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherName),
      profilePhoto: profilePhoto == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePhoto),
      profileGender: profileGender == null && nullToAbsent
          ? const Value.absent()
          : Value(profileGender),
      profileDob: profileDob == null && nullToAbsent
          ? const Value.absent()
          : Value(profileDob),
      profileNationality: profileNationality == null && nullToAbsent
          ? const Value.absent()
          : Value(profileNationality),
      profileOccupation: profileOccupation == null && nullToAbsent
          ? const Value.absent()
          : Value(profileOccupation),
      profileQual: profileQual == null && nullToAbsent
          ? const Value.absent()
          : Value(profileQual),
      recoveryEmail: recoveryEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(recoveryEmail),
      secondaryMobnum: secondaryMobnum == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryMobnum),
      organization: organization == null && nullToAbsent
          ? const Value.absent()
          : Value(organization),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      houseNo: houseNo == null && nullToAbsent
          ? const Value.absent()
          : Value(houseNo),
      locality: locality == null && nullToAbsent
          ? const Value.absent()
          : Value(locality),
      landmark: landmark == null && nullToAbsent
          ? const Value.absent()
          : Value(landmark),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      profileName: profileName == null && nullToAbsent
          ? const Value.absent()
          : Value(profileName),
      modifiedOn: modifiedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedOn),
      modifiedBy: modifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedBy),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
      profileEmail: profileEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(profileEmail),
      profileMobnum: profileMobnum == null && nullToAbsent
          ? const Value.absent()
          : Value(profileMobnum),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      addressEmail: addressEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(addressEmail),
      isActive: isActive == null && nullToAbsent
          ? const Value.absent()
          : Value(isActive),
      profileType: profileType == null && nullToAbsent
          ? const Value.absent()
          : Value(profileType),
      isApproved: isApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(isApproved),
      addressId: addressId == null && nullToAbsent
          ? const Value.absent()
          : Value(addressId),
    );
  }

  factory ProfileTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProfileTable(
      motherName: serializer.fromJson<String>(json['motherName']),
      fatherName: serializer.fromJson<String>(json['fatherName']),
      profilePhoto: serializer.fromJson<String>(json['profilePhoto']),
      profileGender: serializer.fromJson<String>(json['profileGender']),
      profileDob: serializer.fromJson<String>(json['profileDob']),
      profileNationality:
          serializer.fromJson<String>(json['profileNationality']),
      profileOccupation: serializer.fromJson<String>(json['profileOccupation']),
      profileQual: serializer.fromJson<String>(json['profileQual']),
      recoveryEmail: serializer.fromJson<String>(json['recoveryEmail']),
      secondaryMobnum: serializer.fromJson<String>(json['secondaryMobnum']),
      organization: serializer.fromJson<String>(json['organization']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      houseNo: serializer.fromJson<int>(json['houseNo']),
      locality: serializer.fromJson<String>(json['locality']),
      landmark: serializer.fromJson<String>(json['landmark']),
      city: serializer.fromJson<String>(json['city']),
      state: serializer.fromJson<String>(json['state']),
      postalCode: serializer.fromJson<int>(json['postalCode']),
      profileName: serializer.fromJson<String>(json['profileName']),
      modifiedOn: serializer.fromJson<String>(json['modifiedOn']),
      modifiedBy: serializer.fromJson<String>(json['modifiedBy']),
      role: serializer.fromJson<String>(json['role']),
      profileEmail: serializer.fromJson<String>(json['profileEmail']),
      profileMobnum: serializer.fromJson<String>(json['profileMobnum']),
      createdOn: serializer.fromJson<String>(json['createdOn']),
      addressEmail: serializer.fromJson<String>(json['addressEmail']),
      isActive: serializer.fromJson<int>(json['isActive']),
      profileType: serializer.fromJson<int>(json['profileType']),
      isApproved: serializer.fromJson<int>(json['isApproved']),
      addressId: serializer.fromJson<int>(json['addressId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'motherName': serializer.toJson<String>(motherName),
      'fatherName': serializer.toJson<String>(fatherName),
      'profilePhoto': serializer.toJson<String>(profilePhoto),
      'profileGender': serializer.toJson<String>(profileGender),
      'profileDob': serializer.toJson<String>(profileDob),
      'profileNationality': serializer.toJson<String>(profileNationality),
      'profileOccupation': serializer.toJson<String>(profileOccupation),
      'profileQual': serializer.toJson<String>(profileQual),
      'recoveryEmail': serializer.toJson<String>(recoveryEmail),
      'secondaryMobnum': serializer.toJson<String>(secondaryMobnum),
      'organization': serializer.toJson<String>(organization),
      'createdBy': serializer.toJson<String>(createdBy),
      'houseNo': serializer.toJson<int>(houseNo),
      'locality': serializer.toJson<String>(locality),
      'landmark': serializer.toJson<String>(landmark),
      'city': serializer.toJson<String>(city),
      'state': serializer.toJson<String>(state),
      'postalCode': serializer.toJson<int>(postalCode),
      'profileName': serializer.toJson<String>(profileName),
      'modifiedOn': serializer.toJson<String>(modifiedOn),
      'modifiedBy': serializer.toJson<String>(modifiedBy),
      'role': serializer.toJson<String>(role),
      'profileEmail': serializer.toJson<String>(profileEmail),
      'profileMobnum': serializer.toJson<String>(profileMobnum),
      'createdOn': serializer.toJson<String>(createdOn),
      'addressEmail': serializer.toJson<String>(addressEmail),
      'isActive': serializer.toJson<int>(isActive),
      'profileType': serializer.toJson<int>(profileType),
      'isApproved': serializer.toJson<int>(isApproved),
      'addressId': serializer.toJson<int>(addressId),
    };
  }

  ProfileTable copyWith(
          {String motherName,
          String fatherName,
          String profilePhoto,
          String profileGender,
          String profileDob,
          String profileNationality,
          String profileOccupation,
          String profileQual,
          String recoveryEmail,
          String secondaryMobnum,
          String organization,
          String createdBy,
          int houseNo,
          String locality,
          String landmark,
          String city,
          String state,
          int postalCode,
          String profileName,
          String modifiedOn,
          String modifiedBy,
          String role,
          String profileEmail,
          String profileMobnum,
          String createdOn,
          String addressEmail,
          int isActive,
          int profileType,
          int isApproved,
          int addressId}) =>
      ProfileTable(
        motherName: motherName ?? this.motherName,
        fatherName: fatherName ?? this.fatherName,
        profilePhoto: profilePhoto ?? this.profilePhoto,
        profileGender: profileGender ?? this.profileGender,
        profileDob: profileDob ?? this.profileDob,
        profileNationality: profileNationality ?? this.profileNationality,
        profileOccupation: profileOccupation ?? this.profileOccupation,
        profileQual: profileQual ?? this.profileQual,
        recoveryEmail: recoveryEmail ?? this.recoveryEmail,
        secondaryMobnum: secondaryMobnum ?? this.secondaryMobnum,
        organization: organization ?? this.organization,
        createdBy: createdBy ?? this.createdBy,
        houseNo: houseNo ?? this.houseNo,
        locality: locality ?? this.locality,
        landmark: landmark ?? this.landmark,
        city: city ?? this.city,
        state: state ?? this.state,
        postalCode: postalCode ?? this.postalCode,
        profileName: profileName ?? this.profileName,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        role: role ?? this.role,
        profileEmail: profileEmail ?? this.profileEmail,
        profileMobnum: profileMobnum ?? this.profileMobnum,
        createdOn: createdOn ?? this.createdOn,
        addressEmail: addressEmail ?? this.addressEmail,
        isActive: isActive ?? this.isActive,
        profileType: profileType ?? this.profileType,
        isApproved: isApproved ?? this.isApproved,
        addressId: addressId ?? this.addressId,
      );
  @override
  String toString() {
    return (StringBuffer('ProfileTable(')
          ..write('motherName: $motherName, ')
          ..write('fatherName: $fatherName, ')
          ..write('profilePhoto: $profilePhoto, ')
          ..write('profileGender: $profileGender, ')
          ..write('profileDob: $profileDob, ')
          ..write('profileNationality: $profileNationality, ')
          ..write('profileOccupation: $profileOccupation, ')
          ..write('profileQual: $profileQual, ')
          ..write('recoveryEmail: $recoveryEmail, ')
          ..write('secondaryMobnum: $secondaryMobnum, ')
          ..write('organization: $organization, ')
          ..write('createdBy: $createdBy, ')
          ..write('houseNo: $houseNo, ')
          ..write('locality: $locality, ')
          ..write('landmark: $landmark, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('postalCode: $postalCode, ')
          ..write('profileName: $profileName, ')
          ..write('modifiedOn: $modifiedOn, ')
          ..write('modifiedBy: $modifiedBy, ')
          ..write('role: $role, ')
          ..write('profileEmail: $profileEmail, ')
          ..write('profileMobnum: $profileMobnum, ')
          ..write('createdOn: $createdOn, ')
          ..write('addressEmail: $addressEmail, ')
          ..write('isActive: $isActive, ')
          ..write('profileType: $profileType, ')
          ..write('isApproved: $isApproved, ')
          ..write('addressId: $addressId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      motherName.hashCode,
      $mrjc(
          fatherName.hashCode,
          $mrjc(
              profilePhoto.hashCode,
              $mrjc(
                  profileGender.hashCode,
                  $mrjc(
                      profileDob.hashCode,
                      $mrjc(
                          profileNationality.hashCode,
                          $mrjc(
                              profileOccupation.hashCode,
                              $mrjc(
                                  profileQual.hashCode,
                                  $mrjc(
                                      recoveryEmail.hashCode,
                                      $mrjc(
                                          secondaryMobnum.hashCode,
                                          $mrjc(
                                              organization.hashCode,
                                              $mrjc(
                                                  createdBy.hashCode,
                                                  $mrjc(
                                                      houseNo.hashCode,
                                                      $mrjc(
                                                          locality.hashCode,
                                                          $mrjc(
                                                              landmark.hashCode,
                                                              $mrjc(
                                                                  city.hashCode,
                                                                  $mrjc(
                                                                      state
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          postalCode
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              profileName.hashCode,
                                                                              $mrjc(modifiedOn.hashCode, $mrjc(modifiedBy.hashCode, $mrjc(role.hashCode, $mrjc(profileEmail.hashCode, $mrjc(profileMobnum.hashCode, $mrjc(createdOn.hashCode, $mrjc(addressEmail.hashCode, $mrjc(isActive.hashCode, $mrjc(profileType.hashCode, $mrjc(isApproved.hashCode, addressId.hashCode))))))))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProfileTable &&
          other.motherName == this.motherName &&
          other.fatherName == this.fatherName &&
          other.profilePhoto == this.profilePhoto &&
          other.profileGender == this.profileGender &&
          other.profileDob == this.profileDob &&
          other.profileNationality == this.profileNationality &&
          other.profileOccupation == this.profileOccupation &&
          other.profileQual == this.profileQual &&
          other.recoveryEmail == this.recoveryEmail &&
          other.secondaryMobnum == this.secondaryMobnum &&
          other.organization == this.organization &&
          other.createdBy == this.createdBy &&
          other.houseNo == this.houseNo &&
          other.locality == this.locality &&
          other.landmark == this.landmark &&
          other.city == this.city &&
          other.state == this.state &&
          other.postalCode == this.postalCode &&
          other.profileName == this.profileName &&
          other.modifiedOn == this.modifiedOn &&
          other.modifiedBy == this.modifiedBy &&
          other.role == this.role &&
          other.profileEmail == this.profileEmail &&
          other.profileMobnum == this.profileMobnum &&
          other.createdOn == this.createdOn &&
          other.addressEmail == this.addressEmail &&
          other.isActive == this.isActive &&
          other.profileType == this.profileType &&
          other.isApproved == this.isApproved &&
          other.addressId == this.addressId);
}

class ProfileTablesCompanion extends UpdateCompanion<ProfileTable> {
  final Value<String> motherName;
  final Value<String> fatherName;
  final Value<String> profilePhoto;
  final Value<String> profileGender;
  final Value<String> profileDob;
  final Value<String> profileNationality;
  final Value<String> profileOccupation;
  final Value<String> profileQual;
  final Value<String> recoveryEmail;
  final Value<String> secondaryMobnum;
  final Value<String> organization;
  final Value<String> createdBy;
  final Value<int> houseNo;
  final Value<String> locality;
  final Value<String> landmark;
  final Value<String> city;
  final Value<String> state;
  final Value<int> postalCode;
  final Value<String> profileName;
  final Value<String> modifiedOn;
  final Value<String> modifiedBy;
  final Value<String> role;
  final Value<String> profileEmail;
  final Value<String> profileMobnum;
  final Value<String> createdOn;
  final Value<String> addressEmail;
  final Value<int> isActive;
  final Value<int> profileType;
  final Value<int> isApproved;
  final Value<int> addressId;
  const ProfileTablesCompanion({
    this.motherName = const Value.absent(),
    this.fatherName = const Value.absent(),
    this.profilePhoto = const Value.absent(),
    this.profileGender = const Value.absent(),
    this.profileDob = const Value.absent(),
    this.profileNationality = const Value.absent(),
    this.profileOccupation = const Value.absent(),
    this.profileQual = const Value.absent(),
    this.recoveryEmail = const Value.absent(),
    this.secondaryMobnum = const Value.absent(),
    this.organization = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.houseNo = const Value.absent(),
    this.locality = const Value.absent(),
    this.landmark = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.profileName = const Value.absent(),
    this.modifiedOn = const Value.absent(),
    this.modifiedBy = const Value.absent(),
    this.role = const Value.absent(),
    this.profileEmail = const Value.absent(),
    this.profileMobnum = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.addressEmail = const Value.absent(),
    this.isActive = const Value.absent(),
    this.profileType = const Value.absent(),
    this.isApproved = const Value.absent(),
    this.addressId = const Value.absent(),
  });
  ProfileTablesCompanion.insert({
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
    @required String profileName,
    @required String modifiedOn,
    @required String modifiedBy,
    @required String role,
    @required String profileEmail,
    @required String profileMobnum,
    @required String createdOn,
    @required String addressEmail,
    @required int isActive,
    @required int profileType,
    @required int isApproved,
    @required int addressId,
  })  : motherName = Value(motherName),
        fatherName = Value(fatherName),
        profilePhoto = Value(profilePhoto),
        profileGender = Value(profileGender),
        profileDob = Value(profileDob),
        profileNationality = Value(profileNationality),
        profileOccupation = Value(profileOccupation),
        profileQual = Value(profileQual),
        recoveryEmail = Value(recoveryEmail),
        secondaryMobnum = Value(secondaryMobnum),
        organization = Value(organization),
        createdBy = Value(createdBy),
        houseNo = Value(houseNo),
        locality = Value(locality),
        landmark = Value(landmark),
        city = Value(city),
        state = Value(state),
        postalCode = Value(postalCode),
        profileName = Value(profileName),
        modifiedOn = Value(modifiedOn),
        modifiedBy = Value(modifiedBy),
        role = Value(role),
        profileEmail = Value(profileEmail),
        profileMobnum = Value(profileMobnum),
        createdOn = Value(createdOn),
        addressEmail = Value(addressEmail),
        isActive = Value(isActive),
        profileType = Value(profileType),
        isApproved = Value(isApproved),
        addressId = Value(addressId);
  static Insertable<ProfileTable> custom({
    Expression<String> motherName,
    Expression<String> fatherName,
    Expression<String> profilePhoto,
    Expression<String> profileGender,
    Expression<String> profileDob,
    Expression<String> profileNationality,
    Expression<String> profileOccupation,
    Expression<String> profileQual,
    Expression<String> recoveryEmail,
    Expression<String> secondaryMobnum,
    Expression<String> organization,
    Expression<String> createdBy,
    Expression<int> houseNo,
    Expression<String> locality,
    Expression<String> landmark,
    Expression<String> city,
    Expression<String> state,
    Expression<int> postalCode,
    Expression<String> profileName,
    Expression<String> modifiedOn,
    Expression<String> modifiedBy,
    Expression<String> role,
    Expression<String> profileEmail,
    Expression<String> profileMobnum,
    Expression<String> createdOn,
    Expression<String> addressEmail,
    Expression<int> isActive,
    Expression<int> profileType,
    Expression<int> isApproved,
    Expression<int> addressId,
  }) {
    return RawValuesInsertable({
      if (motherName != null) 'mother_name': motherName,
      if (fatherName != null) 'father_name': fatherName,
      if (profilePhoto != null) 'profile_photo': profilePhoto,
      if (profileGender != null) 'profile_gender': profileGender,
      if (profileDob != null) 'profile_dob': profileDob,
      if (profileNationality != null) 'profile_nationality': profileNationality,
      if (profileOccupation != null) 'profile_occupation': profileOccupation,
      if (profileQual != null) 'profile_qual': profileQual,
      if (recoveryEmail != null) 'recovery_email': recoveryEmail,
      if (secondaryMobnum != null) 'secondary_mobnum': secondaryMobnum,
      if (organization != null) 'organization': organization,
      if (createdBy != null) 'created_by': createdBy,
      if (houseNo != null) 'house_no': houseNo,
      if (locality != null) 'locality': locality,
      if (landmark != null) 'landmark': landmark,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (postalCode != null) 'postal_code': postalCode,
      if (profileName != null) 'profile_name': profileName,
      if (modifiedOn != null) 'modified_on': modifiedOn,
      if (modifiedBy != null) 'modified_by': modifiedBy,
      if (role != null) 'role': role,
      if (profileEmail != null) 'profile_email': profileEmail,
      if (profileMobnum != null) 'profile_mobnum': profileMobnum,
      if (createdOn != null) 'created_on': createdOn,
      if (addressEmail != null) 'address_email': addressEmail,
      if (isActive != null) 'is_active': isActive,
      if (profileType != null) 'profile_type': profileType,
      if (isApproved != null) 'is_approved': isApproved,
      if (addressId != null) 'address_id': addressId,
    });
  }

  ProfileTablesCompanion copyWith(
      {Value<String> motherName,
      Value<String> fatherName,
      Value<String> profilePhoto,
      Value<String> profileGender,
      Value<String> profileDob,
      Value<String> profileNationality,
      Value<String> profileOccupation,
      Value<String> profileQual,
      Value<String> recoveryEmail,
      Value<String> secondaryMobnum,
      Value<String> organization,
      Value<String> createdBy,
      Value<int> houseNo,
      Value<String> locality,
      Value<String> landmark,
      Value<String> city,
      Value<String> state,
      Value<int> postalCode,
      Value<String> profileName,
      Value<String> modifiedOn,
      Value<String> modifiedBy,
      Value<String> role,
      Value<String> profileEmail,
      Value<String> profileMobnum,
      Value<String> createdOn,
      Value<String> addressEmail,
      Value<int> isActive,
      Value<int> profileType,
      Value<int> isApproved,
      Value<int> addressId}) {
    return ProfileTablesCompanion(
      motherName: motherName ?? this.motherName,
      fatherName: fatherName ?? this.fatherName,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      profileGender: profileGender ?? this.profileGender,
      profileDob: profileDob ?? this.profileDob,
      profileNationality: profileNationality ?? this.profileNationality,
      profileOccupation: profileOccupation ?? this.profileOccupation,
      profileQual: profileQual ?? this.profileQual,
      recoveryEmail: recoveryEmail ?? this.recoveryEmail,
      secondaryMobnum: secondaryMobnum ?? this.secondaryMobnum,
      organization: organization ?? this.organization,
      createdBy: createdBy ?? this.createdBy,
      houseNo: houseNo ?? this.houseNo,
      locality: locality ?? this.locality,
      landmark: landmark ?? this.landmark,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      profileName: profileName ?? this.profileName,
      modifiedOn: modifiedOn ?? this.modifiedOn,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      role: role ?? this.role,
      profileEmail: profileEmail ?? this.profileEmail,
      profileMobnum: profileMobnum ?? this.profileMobnum,
      createdOn: createdOn ?? this.createdOn,
      addressEmail: addressEmail ?? this.addressEmail,
      isActive: isActive ?? this.isActive,
      profileType: profileType ?? this.profileType,
      isApproved: isApproved ?? this.isApproved,
      addressId: addressId ?? this.addressId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (motherName.present) {
      map['mother_name'] = Variable<String>(motherName.value);
    }
    if (fatherName.present) {
      map['father_name'] = Variable<String>(fatherName.value);
    }
    if (profilePhoto.present) {
      map['profile_photo'] = Variable<String>(profilePhoto.value);
    }
    if (profileGender.present) {
      map['profile_gender'] = Variable<String>(profileGender.value);
    }
    if (profileDob.present) {
      map['profile_dob'] = Variable<String>(profileDob.value);
    }
    if (profileNationality.present) {
      map['profile_nationality'] = Variable<String>(profileNationality.value);
    }
    if (profileOccupation.present) {
      map['profile_occupation'] = Variable<String>(profileOccupation.value);
    }
    if (profileQual.present) {
      map['profile_qual'] = Variable<String>(profileQual.value);
    }
    if (recoveryEmail.present) {
      map['recovery_email'] = Variable<String>(recoveryEmail.value);
    }
    if (secondaryMobnum.present) {
      map['secondary_mobnum'] = Variable<String>(secondaryMobnum.value);
    }
    if (organization.present) {
      map['organization'] = Variable<String>(organization.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (houseNo.present) {
      map['house_no'] = Variable<int>(houseNo.value);
    }
    if (locality.present) {
      map['locality'] = Variable<String>(locality.value);
    }
    if (landmark.present) {
      map['landmark'] = Variable<String>(landmark.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<int>(postalCode.value);
    }
    if (profileName.present) {
      map['profile_name'] = Variable<String>(profileName.value);
    }
    if (modifiedOn.present) {
      map['modified_on'] = Variable<String>(modifiedOn.value);
    }
    if (modifiedBy.present) {
      map['modified_by'] = Variable<String>(modifiedBy.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (profileEmail.present) {
      map['profile_email'] = Variable<String>(profileEmail.value);
    }
    if (profileMobnum.present) {
      map['profile_mobnum'] = Variable<String>(profileMobnum.value);
    }
    if (createdOn.present) {
      map['created_on'] = Variable<String>(createdOn.value);
    }
    if (addressEmail.present) {
      map['address_email'] = Variable<String>(addressEmail.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    if (profileType.present) {
      map['profile_type'] = Variable<int>(profileType.value);
    }
    if (isApproved.present) {
      map['is_approved'] = Variable<int>(isApproved.value);
    }
    if (addressId.present) {
      map['address_id'] = Variable<int>(addressId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileTablesCompanion(')
          ..write('motherName: $motherName, ')
          ..write('fatherName: $fatherName, ')
          ..write('profilePhoto: $profilePhoto, ')
          ..write('profileGender: $profileGender, ')
          ..write('profileDob: $profileDob, ')
          ..write('profileNationality: $profileNationality, ')
          ..write('profileOccupation: $profileOccupation, ')
          ..write('profileQual: $profileQual, ')
          ..write('recoveryEmail: $recoveryEmail, ')
          ..write('secondaryMobnum: $secondaryMobnum, ')
          ..write('organization: $organization, ')
          ..write('createdBy: $createdBy, ')
          ..write('houseNo: $houseNo, ')
          ..write('locality: $locality, ')
          ..write('landmark: $landmark, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('postalCode: $postalCode, ')
          ..write('profileName: $profileName, ')
          ..write('modifiedOn: $modifiedOn, ')
          ..write('modifiedBy: $modifiedBy, ')
          ..write('role: $role, ')
          ..write('profileEmail: $profileEmail, ')
          ..write('profileMobnum: $profileMobnum, ')
          ..write('createdOn: $createdOn, ')
          ..write('addressEmail: $addressEmail, ')
          ..write('isActive: $isActive, ')
          ..write('profileType: $profileType, ')
          ..write('isApproved: $isApproved, ')
          ..write('addressId: $addressId')
          ..write(')'))
        .toString();
  }
}

class $ProfileTablesTable extends ProfileTables
    with TableInfo<$ProfileTablesTable, ProfileTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProfileTablesTable(this._db, [this._alias]);
  final VerificationMeta _motherNameMeta = const VerificationMeta('motherName');
  GeneratedTextColumn _motherName;
  @override
  GeneratedTextColumn get motherName => _motherName ??= _constructMotherName();
  GeneratedTextColumn _constructMotherName() {
    return GeneratedTextColumn(
      'mother_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fatherNameMeta = const VerificationMeta('fatherName');
  GeneratedTextColumn _fatherName;
  @override
  GeneratedTextColumn get fatherName => _fatherName ??= _constructFatherName();
  GeneratedTextColumn _constructFatherName() {
    return GeneratedTextColumn(
      'father_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _profilePhotoMeta =
      const VerificationMeta('profilePhoto');
  GeneratedTextColumn _profilePhoto;
  @override
  GeneratedTextColumn get profilePhoto =>
      _profilePhoto ??= _constructProfilePhoto();
  GeneratedTextColumn _constructProfilePhoto() {
    return GeneratedTextColumn(
      'profile_photo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _profileGenderMeta =
      const VerificationMeta('profileGender');
  GeneratedTextColumn _profileGender;
  @override
  GeneratedTextColumn get profileGender =>
      _profileGender ??= _constructProfileGender();
  GeneratedTextColumn _constructProfileGender() {
    return GeneratedTextColumn(
      'profile_gender',
      $tableName,
      false,
    );
  }

  final VerificationMeta _profileDobMeta = const VerificationMeta('profileDob');
  GeneratedTextColumn _profileDob;
  @override
  GeneratedTextColumn get profileDob => _profileDob ??= _constructProfileDob();
  GeneratedTextColumn _constructProfileDob() {
    return GeneratedTextColumn(
      'profile_dob',
      $tableName,
      false,
    );
  }

  final VerificationMeta _profileNationalityMeta =
      const VerificationMeta('profileNationality');
  GeneratedTextColumn _profileNationality;
  @override
  GeneratedTextColumn get profileNationality =>
      _profileNationality ??= _constructProfileNationality();
  GeneratedTextColumn _constructProfileNationality() {
    return GeneratedTextColumn(
      'profile_nationality',
      $tableName,
      false,
    );
  }

  final VerificationMeta _profileOccupationMeta =
      const VerificationMeta('profileOccupation');
  GeneratedTextColumn _profileOccupation;
  @override
  GeneratedTextColumn get profileOccupation =>
      _profileOccupation ??= _constructProfileOccupation();
  GeneratedTextColumn _constructProfileOccupation() {
    return GeneratedTextColumn(
      'profile_occupation',
      $tableName,
      false,
    );
  }

  final VerificationMeta _profileQualMeta =
      const VerificationMeta('profileQual');
  GeneratedTextColumn _profileQual;
  @override
  GeneratedTextColumn get profileQual =>
      _profileQual ??= _constructProfileQual();
  GeneratedTextColumn _constructProfileQual() {
    return GeneratedTextColumn(
      'profile_qual',
      $tableName,
      false,
    );
  }

  final VerificationMeta _recoveryEmailMeta =
      const VerificationMeta('recoveryEmail');
  GeneratedTextColumn _recoveryEmail;
  @override
  GeneratedTextColumn get recoveryEmail =>
      _recoveryEmail ??= _constructRecoveryEmail();
  GeneratedTextColumn _constructRecoveryEmail() {
    return GeneratedTextColumn(
      'recovery_email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _secondaryMobnumMeta =
      const VerificationMeta('secondaryMobnum');
  GeneratedTextColumn _secondaryMobnum;
  @override
  GeneratedTextColumn get secondaryMobnum =>
      _secondaryMobnum ??= _constructSecondaryMobnum();
  GeneratedTextColumn _constructSecondaryMobnum() {
    return GeneratedTextColumn(
      'secondary_mobnum',
      $tableName,
      false,
    );
  }

  final VerificationMeta _organizationMeta =
      const VerificationMeta('organization');
  GeneratedTextColumn _organization;
  @override
  GeneratedTextColumn get organization =>
      _organization ??= _constructOrganization();
  GeneratedTextColumn _constructOrganization() {
    return GeneratedTextColumn(
      'organization',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      false,
    );
  }

  final VerificationMeta _houseNoMeta = const VerificationMeta('houseNo');
  GeneratedIntColumn _houseNo;
  @override
  GeneratedIntColumn get houseNo => _houseNo ??= _constructHouseNo();
  GeneratedIntColumn _constructHouseNo() {
    return GeneratedIntColumn(
      'house_no',
      $tableName,
      false,
    );
  }

  final VerificationMeta _localityMeta = const VerificationMeta('locality');
  GeneratedTextColumn _locality;
  @override
  GeneratedTextColumn get locality => _locality ??= _constructLocality();
  GeneratedTextColumn _constructLocality() {
    return GeneratedTextColumn(
      'locality',
      $tableName,
      false,
    );
  }

  final VerificationMeta _landmarkMeta = const VerificationMeta('landmark');
  GeneratedTextColumn _landmark;
  @override
  GeneratedTextColumn get landmark => _landmark ??= _constructLandmark();
  GeneratedTextColumn _constructLandmark() {
    return GeneratedTextColumn(
      'landmark',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cityMeta = const VerificationMeta('city');
  GeneratedTextColumn _city;
  @override
  GeneratedTextColumn get city => _city ??= _constructCity();
  GeneratedTextColumn _constructCity() {
    return GeneratedTextColumn(
      'city',
      $tableName,
      false,
    );
  }

  final VerificationMeta _stateMeta = const VerificationMeta('state');
  GeneratedTextColumn _state;
  @override
  GeneratedTextColumn get state => _state ??= _constructState();
  GeneratedTextColumn _constructState() {
    return GeneratedTextColumn(
      'state',
      $tableName,
      false,
    );
  }

  final VerificationMeta _postalCodeMeta = const VerificationMeta('postalCode');
  GeneratedIntColumn _postalCode;
  @override
  GeneratedIntColumn get postalCode => _postalCode ??= _constructPostalCode();
  GeneratedIntColumn _constructPostalCode() {
    return GeneratedIntColumn(
      'postal_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _profileNameMeta =
      const VerificationMeta('profileName');
  GeneratedTextColumn _profileName;
  @override
  GeneratedTextColumn get profileName =>
      _profileName ??= _constructProfileName();
  GeneratedTextColumn _constructProfileName() {
    return GeneratedTextColumn(
      'profile_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _modifiedOnMeta = const VerificationMeta('modifiedOn');
  GeneratedTextColumn _modifiedOn;
  @override
  GeneratedTextColumn get modifiedOn => _modifiedOn ??= _constructModifiedOn();
  GeneratedTextColumn _constructModifiedOn() {
    return GeneratedTextColumn(
      'modified_on',
      $tableName,
      false,
    );
  }

  final VerificationMeta _modifiedByMeta = const VerificationMeta('modifiedBy');
  GeneratedTextColumn _modifiedBy;
  @override
  GeneratedTextColumn get modifiedBy => _modifiedBy ??= _constructModifiedBy();
  GeneratedTextColumn _constructModifiedBy() {
    return GeneratedTextColumn(
      'modified_by',
      $tableName,
      false,
    );
  }

  final VerificationMeta _roleMeta = const VerificationMeta('role');
  GeneratedTextColumn _role;
  @override
  GeneratedTextColumn get role => _role ??= _constructRole();
  GeneratedTextColumn _constructRole() {
    return GeneratedTextColumn(
      'role',
      $tableName,
      false,
    );
  }

  final VerificationMeta _profileEmailMeta =
      const VerificationMeta('profileEmail');
  GeneratedTextColumn _profileEmail;
  @override
  GeneratedTextColumn get profileEmail =>
      _profileEmail ??= _constructProfileEmail();
  GeneratedTextColumn _constructProfileEmail() {
    return GeneratedTextColumn(
      'profile_email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _profileMobnumMeta =
      const VerificationMeta('profileMobnum');
  GeneratedTextColumn _profileMobnum;
  @override
  GeneratedTextColumn get profileMobnum =>
      _profileMobnum ??= _constructProfileMobnum();
  GeneratedTextColumn _constructProfileMobnum() {
    return GeneratedTextColumn(
      'profile_mobnum',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdOnMeta = const VerificationMeta('createdOn');
  GeneratedTextColumn _createdOn;
  @override
  GeneratedTextColumn get createdOn => _createdOn ??= _constructCreatedOn();
  GeneratedTextColumn _constructCreatedOn() {
    return GeneratedTextColumn(
      'created_on',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressEmailMeta =
      const VerificationMeta('addressEmail');
  GeneratedTextColumn _addressEmail;
  @override
  GeneratedTextColumn get addressEmail =>
      _addressEmail ??= _constructAddressEmail();
  GeneratedTextColumn _constructAddressEmail() {
    return GeneratedTextColumn(
      'address_email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isActiveMeta = const VerificationMeta('isActive');
  GeneratedIntColumn _isActive;
  @override
  GeneratedIntColumn get isActive => _isActive ??= _constructIsActive();
  GeneratedIntColumn _constructIsActive() {
    return GeneratedIntColumn(
      'is_active',
      $tableName,
      false,
    );
  }

  final VerificationMeta _profileTypeMeta =
      const VerificationMeta('profileType');
  GeneratedIntColumn _profileType;
  @override
  GeneratedIntColumn get profileType =>
      _profileType ??= _constructProfileType();
  GeneratedIntColumn _constructProfileType() {
    return GeneratedIntColumn(
      'profile_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isApprovedMeta = const VerificationMeta('isApproved');
  GeneratedIntColumn _isApproved;
  @override
  GeneratedIntColumn get isApproved => _isApproved ??= _constructIsApproved();
  GeneratedIntColumn _constructIsApproved() {
    return GeneratedIntColumn(
      'is_approved',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressIdMeta = const VerificationMeta('addressId');
  GeneratedIntColumn _addressId;
  @override
  GeneratedIntColumn get addressId => _addressId ??= _constructAddressId();
  GeneratedIntColumn _constructAddressId() {
    return GeneratedIntColumn(
      'address_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        motherName,
        fatherName,
        profilePhoto,
        profileGender,
        profileDob,
        profileNationality,
        profileOccupation,
        profileQual,
        recoveryEmail,
        secondaryMobnum,
        organization,
        createdBy,
        houseNo,
        locality,
        landmark,
        city,
        state,
        postalCode,
        profileName,
        modifiedOn,
        modifiedBy,
        role,
        profileEmail,
        profileMobnum,
        createdOn,
        addressEmail,
        isActive,
        profileType,
        isApproved,
        addressId
      ];
  @override
  $ProfileTablesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'profile_tables';
  @override
  final String actualTableName = 'profile_tables';
  @override
  VerificationContext validateIntegrity(Insertable<ProfileTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mother_name')) {
      context.handle(
          _motherNameMeta,
          motherName.isAcceptableOrUnknown(
              data['mother_name'], _motherNameMeta));
    } else if (isInserting) {
      context.missing(_motherNameMeta);
    }
    if (data.containsKey('father_name')) {
      context.handle(
          _fatherNameMeta,
          fatherName.isAcceptableOrUnknown(
              data['father_name'], _fatherNameMeta));
    } else if (isInserting) {
      context.missing(_fatherNameMeta);
    }
    if (data.containsKey('profile_photo')) {
      context.handle(
          _profilePhotoMeta,
          profilePhoto.isAcceptableOrUnknown(
              data['profile_photo'], _profilePhotoMeta));
    } else if (isInserting) {
      context.missing(_profilePhotoMeta);
    }
    if (data.containsKey('profile_gender')) {
      context.handle(
          _profileGenderMeta,
          profileGender.isAcceptableOrUnknown(
              data['profile_gender'], _profileGenderMeta));
    } else if (isInserting) {
      context.missing(_profileGenderMeta);
    }
    if (data.containsKey('profile_dob')) {
      context.handle(
          _profileDobMeta,
          profileDob.isAcceptableOrUnknown(
              data['profile_dob'], _profileDobMeta));
    } else if (isInserting) {
      context.missing(_profileDobMeta);
    }
    if (data.containsKey('profile_nationality')) {
      context.handle(
          _profileNationalityMeta,
          profileNationality.isAcceptableOrUnknown(
              data['profile_nationality'], _profileNationalityMeta));
    } else if (isInserting) {
      context.missing(_profileNationalityMeta);
    }
    if (data.containsKey('profile_occupation')) {
      context.handle(
          _profileOccupationMeta,
          profileOccupation.isAcceptableOrUnknown(
              data['profile_occupation'], _profileOccupationMeta));
    } else if (isInserting) {
      context.missing(_profileOccupationMeta);
    }
    if (data.containsKey('profile_qual')) {
      context.handle(
          _profileQualMeta,
          profileQual.isAcceptableOrUnknown(
              data['profile_qual'], _profileQualMeta));
    } else if (isInserting) {
      context.missing(_profileQualMeta);
    }
    if (data.containsKey('recovery_email')) {
      context.handle(
          _recoveryEmailMeta,
          recoveryEmail.isAcceptableOrUnknown(
              data['recovery_email'], _recoveryEmailMeta));
    } else if (isInserting) {
      context.missing(_recoveryEmailMeta);
    }
    if (data.containsKey('secondary_mobnum')) {
      context.handle(
          _secondaryMobnumMeta,
          secondaryMobnum.isAcceptableOrUnknown(
              data['secondary_mobnum'], _secondaryMobnumMeta));
    } else if (isInserting) {
      context.missing(_secondaryMobnumMeta);
    }
    if (data.containsKey('organization')) {
      context.handle(
          _organizationMeta,
          organization.isAcceptableOrUnknown(
              data['organization'], _organizationMeta));
    } else if (isInserting) {
      context.missing(_organizationMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('house_no')) {
      context.handle(_houseNoMeta,
          houseNo.isAcceptableOrUnknown(data['house_no'], _houseNoMeta));
    } else if (isInserting) {
      context.missing(_houseNoMeta);
    }
    if (data.containsKey('locality')) {
      context.handle(_localityMeta,
          locality.isAcceptableOrUnknown(data['locality'], _localityMeta));
    } else if (isInserting) {
      context.missing(_localityMeta);
    }
    if (data.containsKey('landmark')) {
      context.handle(_landmarkMeta,
          landmark.isAcceptableOrUnknown(data['landmark'], _landmarkMeta));
    } else if (isInserting) {
      context.missing(_landmarkMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city'], _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state'], _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code'], _postalCodeMeta));
    } else if (isInserting) {
      context.missing(_postalCodeMeta);
    }
    if (data.containsKey('profile_name')) {
      context.handle(
          _profileNameMeta,
          profileName.isAcceptableOrUnknown(
              data['profile_name'], _profileNameMeta));
    } else if (isInserting) {
      context.missing(_profileNameMeta);
    }
    if (data.containsKey('modified_on')) {
      context.handle(
          _modifiedOnMeta,
          modifiedOn.isAcceptableOrUnknown(
              data['modified_on'], _modifiedOnMeta));
    } else if (isInserting) {
      context.missing(_modifiedOnMeta);
    }
    if (data.containsKey('modified_by')) {
      context.handle(
          _modifiedByMeta,
          modifiedBy.isAcceptableOrUnknown(
              data['modified_by'], _modifiedByMeta));
    } else if (isInserting) {
      context.missing(_modifiedByMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role'], _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('profile_email')) {
      context.handle(
          _profileEmailMeta,
          profileEmail.isAcceptableOrUnknown(
              data['profile_email'], _profileEmailMeta));
    } else if (isInserting) {
      context.missing(_profileEmailMeta);
    }
    if (data.containsKey('profile_mobnum')) {
      context.handle(
          _profileMobnumMeta,
          profileMobnum.isAcceptableOrUnknown(
              data['profile_mobnum'], _profileMobnumMeta));
    } else if (isInserting) {
      context.missing(_profileMobnumMeta);
    }
    if (data.containsKey('created_on')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['created_on'], _createdOnMeta));
    } else if (isInserting) {
      context.missing(_createdOnMeta);
    }
    if (data.containsKey('address_email')) {
      context.handle(
          _addressEmailMeta,
          addressEmail.isAcceptableOrUnknown(
              data['address_email'], _addressEmailMeta));
    } else if (isInserting) {
      context.missing(_addressEmailMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active'], _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('profile_type')) {
      context.handle(
          _profileTypeMeta,
          profileType.isAcceptableOrUnknown(
              data['profile_type'], _profileTypeMeta));
    } else if (isInserting) {
      context.missing(_profileTypeMeta);
    }
    if (data.containsKey('is_approved')) {
      context.handle(
          _isApprovedMeta,
          isApproved.isAcceptableOrUnknown(
              data['is_approved'], _isApprovedMeta));
    } else if (isInserting) {
      context.missing(_isApprovedMeta);
    }
    if (data.containsKey('address_id')) {
      context.handle(_addressIdMeta,
          addressId.isAcceptableOrUnknown(data['address_id'], _addressIdMeta));
    } else if (isInserting) {
      context.missing(_addressIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recoveryEmail};
  @override
  ProfileTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ProfileTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProfileTablesTable createAlias(String alias) {
    return $ProfileTablesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UserLogTablesTable _userLogTables;
  $UserLogTablesTable get userLogTables =>
      _userLogTables ??= $UserLogTablesTable(this);
  $ProfileTablesTable _profileTables;
  $ProfileTablesTable get profileTables =>
      _profileTables ??= $ProfileTablesTable(this);
  UserLogDao _userLogDao;
  UserLogDao get userLogDao => _userLogDao ??= UserLogDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userLogTables, profileTables];
}
