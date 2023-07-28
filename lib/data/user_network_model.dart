class UserNetworkModel {
  String? id;
  String? name;
  String? surname;
  String? role;
  String? status;
  bool? isAdmin;
  String? email;
  String? phone;
  String? imageUrl;

  UserNetworkModel(
      {this.id,
      this.name,
      this.surname,
      this.role,
      this.status,
      this.isAdmin,
      this.email,
      this.phone,
      this.imageUrl});

  UserNetworkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    role = json['role'];
    status = json['status'];
    isAdmin = json['isAdmin'];
    email = json['email'];
    phone = json['phone'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['role'] = role;
    data['status'] = status;
    data['isAdmin'] = isAdmin;
    data['email'] = email;
    data['phone'] = phone;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
