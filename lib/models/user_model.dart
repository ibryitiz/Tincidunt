class UserModel {
  dynamic id;
  String name;

  UserModel({
    this.id,
    required this.name,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, {dynamic key}) {
    return UserModel(
      id: key ?? map["id"],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }
}
