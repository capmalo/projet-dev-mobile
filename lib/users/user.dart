class User {
  String id;
  String fname;
  String lname;
  String email;
  String username;
  String title;
  int age;
  String phonenum;
  String picture;

  User(String id, String fname, String lname, String email, String username, String title, int age, String phonenum, String picture) {
    this.id = id;
    this.fname = fname;
    this.lname = lname;
    this.email = email;
    this.username = username;
    this.title = title;
    this.age = age;
    this.phonenum = phonenum;
    this.picture = picture;
  }

  /*User.fromJson(Map json)
      : id = json['login']['uuid'],
        name = json['name']['first'],
        email = json['email'];*/
}