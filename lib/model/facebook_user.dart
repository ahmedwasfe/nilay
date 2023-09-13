class FacebookUser {
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  Picture? picture;
  String? id;

  FacebookUser(
      {this.name,
        this.firstName,
        this.lastName,
        this.email,
        this.picture,
        this.id});

  FacebookUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    picture =
    json['picture'] != null ? Picture.fromJson(json['picture']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    if (picture != null) {
      data['picture'] = picture!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Picture {
  PictureData? picture;

  Picture({this.picture});

  Picture.fromJson(Map<String, dynamic> json) {
    picture = json['data'] != null ? PictureData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (picture != null) {
      data['data'] = picture!.toJson();
    }
    return data;
  }
}

class PictureData {
  int? height;
  bool? isSilhouette;
  String? url;
  int? width;

  PictureData({this.height, this.isSilhouette, this.url, this.width});

  PictureData.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    isSilhouette = json['is_silhouette'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['height'] = height;
    data['is_silhouette'] = isSilhouette;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}