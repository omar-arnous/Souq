class User {
  const User({
    required this.email,
    this.confirmEmail,
    this.name,
    required this.pass,
  });

  final String email;
  final String? confirmEmail;
  final String? name;
  final String pass;

  Map<String, dynamic> signin() => {
        'name': name,
        'email': email,
        'confirm-email': confirmEmail,
        'password': pass,
      };

  Map<String, dynamic> login() => {
        'email': email,
        'password': pass,
      };
}
