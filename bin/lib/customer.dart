import 'menuitem.dart';
import 'user.dart';
import 'order.dart';

class Customer extends User {
  final Order order = Order();

  Customer({required String name}) : super(name: name);

  @override
  void displayRole() => print("Role: Customer");

  void browseMenu(List<MenuItem> menu) {
    print("Menu:");
    for (var item in menu) {
      item.display();
    }
  }

  void addToOrder(MenuItem item) => order.addItem(item);

  void addToOrderByName(List<MenuItem> menu, String name) {
    for (var item in menu) {
      if (item.name == name) {
        order.addItem(item);
        return;
      }
    }
    print("Item not found.");
  }

  void modifyOrder(String oldName, String newName, double price) {
    order.updateItemWithCascade(oldName, newName, price);
  }

  void removeFromOrder(String name) => order.removeItem(name);
}
