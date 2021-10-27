class UserModelDetails {
  int? id;
  String? name;
  String? email;
  String? password;
  String? userType;

  UserModelDetails(
      {this.id, this.name, this.email, this.password, this.userType});

  UserModelDetails.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
    password = json['password'];
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['userType'] = userType;
    return map;
  }
}
