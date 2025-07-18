import 'menuitem.dart';

class Restaurant {
  static final List<MenuItem> menu = [
    MenuItem(name: "Burger", price: 5.0),
    MenuItem(name: "Pizza", price: 8.5),
    MenuItem(name: "Pasta", price: 6.0),
  ];

  static List<MenuItem> getMenu() => menu;
}
