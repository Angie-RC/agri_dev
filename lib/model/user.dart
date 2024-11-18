class User {
  final String username;
  final String email;
  final String password;
  final String? country;
  final String? city;

  User({
    required this.username,
    required this.email,
    required this.password,
    this.country,
    this.city,
  });

  // Para convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'country': country,
      'city': city,
    };
  }
}
