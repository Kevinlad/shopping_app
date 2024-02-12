class UserModel {
  final String id;
  final String email;
  final String username;
  final String phoneNumber;
  final String photoURL;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.photoURL,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      username: map['username'],
      phoneNumber: map['phoneNumber'],
      photoURL: map['photo'],
    );
  }
}
