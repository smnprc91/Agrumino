
class User {
  final String username;
  final String password;

  User(this.username, this.password);

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };

}