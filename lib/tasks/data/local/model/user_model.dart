class User {
  String email;
  String password;

  User({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
    );
  }

  @override
  String toString() {
    return 'User{email: $email, password: $password}';
  }
}
