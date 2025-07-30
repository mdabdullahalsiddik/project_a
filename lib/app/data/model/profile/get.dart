class ProfileGetModel {
  String? sId;
  String? userName;
  String? userEmail;
  String? userPhone;
  bool? userPhoneIsVerified;
  bool? userEmailIsVerified;
  bool? userSocialIsVerified;
  int? otpCode;
  String? otpExpiresAt;
  String? userAddress;
  String? userGender;
  String? userDateOfBirth;
  List<String>? userSelectedCountries;
  List<String>? userSelectedSkills;
  List<String>? userJobs;
  bool? userIsExperienced;
  bool? userIsHavePassport;
  String? userProfile;
  String? userStatus;
  String? role;

  String? createdAt;
  String? updatedAt;
  int? iV;
  String? userPassword;
  String? userCity;
  String? userCountry;
  String? userCurrentJob;
  String? userCurrentJobCountry;
  String? userEducationalQualification;
  String? userPassportNumber;

  ProfileGetModel(
      {this.sId,
      this.userName,
      this.userEmail,
      this.userPhone,
      this.userPhoneIsVerified,
      this.userEmailIsVerified,
      this.userSocialIsVerified,
      this.otpCode,
      this.otpExpiresAt,
      this.userAddress,
      this.userGender,
      this.userDateOfBirth,
      this.userSelectedCountries,
      this.userSelectedSkills,
      this.userJobs,
      this.userIsExperienced,
      this.userIsHavePassport,
      this.userProfile,
      this.userStatus,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.userPassword,
      this.userCity,
      this.userCountry,
      this.userCurrentJob,
      this.userCurrentJobCountry,
      this.userEducationalQualification,
      this.userPassportNumber});

  ProfileGetModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userPhoneIsVerified = json['user_phone_is_verified'];
    userEmailIsVerified = json['user_email_is_verified'];
    userSocialIsVerified = json['user_social_is_verified'];
    otpCode = json['otp_code'];
    otpExpiresAt = json['otp_expires_at'];
    userAddress = json['user_address'];
    userGender = json['user_gender'];
    userDateOfBirth = json['user_date_of_birth'];
    userSelectedCountries = json['user_selected_countries'].cast<String>();
    userSelectedSkills = json['user_selected_skills'].cast<String>();
    userJobs = json['user_jobs'].cast<String>();
    userIsExperienced = json['user_is_experienced'];
    userIsHavePassport = json['user_is_have_passport'];
    userProfile = json['user_profile'];
    userStatus = json['user_status'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    userPassword = json['user_password'];
    userCity = json['user_city'];
    userCountry = json['user_country'];
    userCurrentJob = json['user_current_job'];
    userCurrentJobCountry = json['user_current_job_country'];
    userEducationalQualification = json['user_educational_qualification'];
    userPassportNumber = json['user_passport_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userPhone;
    data['user_phone_is_verified'] = this.userPhoneIsVerified;
    data['user_email_is_verified'] = this.userEmailIsVerified;
    data['user_social_is_verified'] = this.userSocialIsVerified;
    data['otp_code'] = this.otpCode;
    data['otp_expires_at'] = this.otpExpiresAt;
    data['user_address'] = this.userAddress;
    data['user_gender'] = this.userGender;
    data['user_date_of_birth'] = this.userDateOfBirth;
    data['user_selected_countries'] = this.userSelectedCountries;
    data['user_selected_skills'] = this.userSelectedSkills;
    data['user_jobs'] = this.userJobs;
    data['user_is_experienced'] = this.userIsExperienced;
    data['user_is_have_passport'] = this.userIsHavePassport;
    data['user_profile'] = this.userProfile;
    data['user_status'] = this.userStatus;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['user_password'] = this.userPassword;
    data['user_city'] = this.userCity;
    data['user_country'] = this.userCountry;
    data['user_current_job'] = this.userCurrentJob;
    data['user_current_job_country'] = this.userCurrentJobCountry;
    data['user_educational_qualification'] = this.userEducationalQualification;
    data['user_passport_number'] = this.userPassportNumber;
    return data;
  }
}
