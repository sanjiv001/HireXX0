class UserModel {
  String? uid;
  String? email;
  String? contact;
  String? username;

  UserModel({this.uid, this.email, this.contact, this.username});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      contact: map['contact'],
      username: map['username'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'contact': contact,
      'username': username,
    };
  }
}
