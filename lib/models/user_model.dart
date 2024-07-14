class UserModel {
  String name;
  int score;

  UserModel({
    required this.name,
    required this.score,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      score: map['score'],
    );
  }

  Map<String, dynamic> toMap({dynamic key}) {
    return {
      "name": name,
      "score": score,
    };
  }
}
