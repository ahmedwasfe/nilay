class CurrentUser {
  int? id;
  String? uuid;
  String? name;
  String? mobile;
  String? email;
  String? photo;
  String? userType;
  String? provider;
  String? address;
  dynamic emailVerifiedAt;


  CurrentUser({this.id,
    this.uuid,
    this.name,
    this.mobile,
    this.email,
    this.photo,
    this.userType,
    this.provider,
    this.address,
    this.emailVerifiedAt});

  CurrentUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    photo = json['photo'];
    userType = json['user_type'];
    provider = json['provider'];
    address = json['address'];
    emailVerifiedAt = json['email_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['photo'] = photo;
    data['user_type'] = userType;
    data['provider'] = provider;
    data['address'] = address;
    data['email_verified_at'] = emailVerifiedAt;
    return data;
  }
}