class User {
  final int id;
  final String username;

  User({
    required this.id,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: (json['id'] ?? json['pk'] ?? 0) as int,
      username: (json['username'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
  };
}
