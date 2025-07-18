import 'menuitem.dart';
import 'user.dart';

class Admin extends User {
  static const String _password = "admin123";
  final List<MenuItem> menu;

  Admin({required String name, required this.menu})
    : super(name: name, isAdmin: true);
  @override
  void displayRole() => print("Role: Admin");

  static bool authenticate(String input) => input == _password;

  void showMenu() {
    print("Menu:");
    menu.forEach((item) => item.display());
  }
  // void showMenu() {
  //   for (var item in menu)
  // item.display();
  // }

  void addItem(String name, double price) {
    menu.add(MenuItem(name: name, price: price));
    print("Item added.");
  }

  void updateItem(String oldName, String newName, double newPrice) {
    for (var item in menu) {
      if (item.name == oldName) {
        item.name = newName;
        item.price = newPrice;
        print("Item updated.");
        return;
      }
    }
    print("Item not found.");
  }

  void removeItem(String name) {
    menu.removeWhere((item) => item.name == name);
    print("Item removed.");
  }
}
