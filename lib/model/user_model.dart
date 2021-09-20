class User {
  int? id;
  String? username;
  String? token;

  User(
      {this.id,
      this.username,
      this.token}
      );

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
      id: data['id'],
      username: data['username'],
      token: data['token'],
  );

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "username": this.username,
        "token": this.token
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'], username: json['username'], token: json['token']);
  }
  dynamic toJson() => {'id': id, 'username': username, 'token': token};


}

