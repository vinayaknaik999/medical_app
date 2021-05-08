class User {
  String name;
  String password;
  String username;
  String type;

  User({this.name, this.password, this.username, this.type});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    username = json['username'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['password'] = this.password;
    data['username'] = this.username;
    data['type'] = this.type;
    return data;
  }
}

List<User> users = [
  User(
      name: "swathi", password: "password", username: "swathi", type: "doctor"),
  User(name: "suchith", password: "password", username: "suchith", type: "user")
];

class Appointment {
  String key;
  String date;
  String username;
  String description;

  Appointment({this.key, this.date, this.username, this.description});

  Appointment.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    date = json['date'];
    username = json['username'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['date'] = this.date;
    data['username'] = this.username;
    data['description'] = this.description;
    return data;
  }
}
