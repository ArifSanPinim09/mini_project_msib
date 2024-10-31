class UserModel {
  String? id;
  String? username;
  String? name;
  String? address;
  String? phoneNumber;
  String? password;

  UserModel({
    this.name,
    this.username,
    this.address,
    this.phoneNumber,
    this.id,
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
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "address": address,
        "phoneNumber": phoneNumber,
        "password": password,
      };
}
