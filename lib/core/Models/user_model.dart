class UserModel {
  static UserModel? userLogged;
  String id;
  String name;
  String email;
  UserModel({required this.id, required this.name, required this.email});

  static UserModel fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData["id"],
      name: jsonData["name"],
      email: jsonData["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email};
  }
}
