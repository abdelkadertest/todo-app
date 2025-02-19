class UserModel {
  String? name;
  String? email;
  String? id;
  int? createdAt;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.createdAt,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json["name"]! as String,
          email: json["email"]! as String,
          id: json["id"]! as String,
          createdAt: json["createdAt"]! as int,
        );

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "id": id,
      "createdAt": createdAt,
    };
  }
}
