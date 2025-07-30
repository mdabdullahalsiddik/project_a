class ServiceListModel {
  String? sId;
  String? name;
  String? location;
  num? latitude;
  num? longitude;
  String? website;
  List<String>? phone;
  List<String>? email;
  String? contact;
  String? status;
  String? createdAt;
  String? updatedAt;
  num? iV;
  num? distance;

  ServiceListModel(
      {this.sId,
      this.name,
      this.location,
      this.latitude,
      this.longitude,
      this.website,
      this.phone,
      this.email,
      this.contact,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.distance});

  ServiceListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    website = json['website'];
    phone = json['phone'].cast<String>();
    email = json['email'].cast<String>();
    contact = json['contact'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['website'] = this.website;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['distance'] = this.distance;
    return data;
  }
}
