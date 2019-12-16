class User {
  String id;
  String name;
  String email;

  User(String id, String name, String email) {
    this.id = id;
    this.name = name;
    this.email = email;
  }

  User.fromJson(Map json)
      : id = json['login']['uuid'],
        name = json['name']['first'],
        email = json['email'];
}