// {
//     "data": {
//         "id": 2,
//         "email": "janet.weaver@reqres.in",
//         "first_name": "Janet",
//         "last_name": "Weaver",
//         "avatar": "https://reqres.in/img/faces/2-image.jpg"
//     }
// }

class User {
  Data data;
  User({required this.data});

  factory User.fromJSON(Map<String, dynamic> map) {
    return User(
      data: Data.fromJSON(map['data']),
    );
  }
  Map<String, dynamic> toJSON() {
    return {
      'data': data,
    };
  }
}

class Data {
  int id;
  String email;
  String fName;
  String lName;
  String avatar;
  Data(
      {required this.id,
      required this.fName,
      required this.lName,
      required this.email,
      required this.avatar});

  factory Data.fromJSON(Map<String, dynamic> map) {
    return Data(
        id: map['id'],
        fName: map['first_name'],
        lName: map['last_name'],
        email: map['email'],
        avatar: map['avatar']);
  }
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      "email": email,
      "first_name": fName,
      "last_name": lName,
      "avatar": avatar
    };
  }
}
