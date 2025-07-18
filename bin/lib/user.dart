abstract class User {
  String name;
  final bool isAdmin;

  User({required this.name, this.isAdmin = false});
  String get role => isAdmin ? "admin" : "customer";

  void displayRole();
}
