class UserModel {
  String? id;
  String? username;
  String? name;
  String? address;
  String? phoneNumber;
  String? photoUrl;
  String? password;

  UserModel({
    this.id,
    this.username,
    this.name,
    this.address,
    this.phoneNumber,
    this.photoUrl,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "address": address,
        "phoneNumber": phoneNumber,
        "password": password,
        "photoUrl": photoUrl,
      };
}
