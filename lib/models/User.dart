class User {
  int id;
  String name;
  String phoneNumber;
  String password;

  User({required this.id, required this.name, required this.phoneNumber, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
    );
  }
}
