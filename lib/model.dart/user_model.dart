class UserModel {
  String uid;
  String? name;
  String? email;

  String? photoUrl;
  UserModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.photoUrl});
}
