class Profile {
  String email;
  String password;
  String name;
  String surname;
  String birthday;
  String gender;
  String phonenum;
  String address;
  String weight;
  String height;

  Profile({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
    required this.birthday,
    required this.gender,
    required this.phonenum,
    required this.address,
    required this.weight,
    required this.height,
  });
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        email: json["email"],
        password: json["password"],
        name: json["name"],
        surname: json["surname"],
        birthday: json["birthday"],
        gender: json["gender"],
        phonenum: json["phonenum"],
        address: json["address"],
        weight: json["weight"],
        height: json["height"]);
  }
  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
        "surname": surname,
        "birthday": birthday,
        "gender": gender,
        "phonenum": phonenum,
        "address": address,
        "weight": weight,
        "height": height
      };
}
