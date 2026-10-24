class UserModel {
  static UserModel? userLogged;
  String id;
  String name;
  String email;
  List<String> favoriteEventsId = [];
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.favoriteEventsId,
  });

  static UserModel fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData["id"],
      name: jsonData["name"],
      email: jsonData["email"],
      favoriteEventsId: List<String>.from(jsonData["favoriteEventsId"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "favoriteEventsId": favoriteEventsId,
    };
  }
}
