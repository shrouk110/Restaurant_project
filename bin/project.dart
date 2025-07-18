import 'package:project/project.dart' as project;
import 'dart:io';
import 'dart:async';
import 'lib/order.dart';
import 'lib/user.dart';
import 'lib/customer.dart';
import 'lib/admin.dart';
import 'lib/menuitem.dart';
import 'lib/restaurant.dart';

void main() async {
  print("Welcome to Dart Restaurant System!");

  stdout.write("Are you a customer or admin? (c/a): ");
  String? role = stdin.readLineSync();

  role = role == 'c' || role == 'a' ? role : null;

  if (role == "a") {
    stdout.write("Enter admin password: ");
    String? pass = stdin.readLineSync();

    if (Admin.authenticate(pass!)) {
      Admin admin = Admin(name: "Admin", menu: Restaurant.getMenu());
      print("\nLogin successful as Admin!");
      admin.displayRole();

      while (true) {
        print(
          "\n[1] Show Menu\n[2] Add Item\n[3] Update Item\n[4] Remove Item\n[0] Exit",
        );
        stdout.write("Choice: ");
        String? choice = stdin.readLineSync();

        switch (choice) {
          case "1":
            admin.showMenu();
            break;
          case "2":
            stdout.write("Enter item name: ");
            String? name = stdin.readLineSync();
            stdout.write("Enter price: ");
            double price = double.parse(stdin.readLineSync()!);
            admin.addItem(name!, price);
            break;
          case "3":
            stdout.write("Old item name: ");
            String? old = stdin.readLineSync();
            stdout.write("New name: ");
            String? newName = stdin.readLineSync();
            stdout.write("New price: ");
            double newPrice = double.parse(stdin.readLineSync()!);
            admin.updateItem(old!, newName!, newPrice);
            break;
          case "4":
            stdout.write("Item name to remove: ");
            String? name = stdin.readLineSync();
            admin.removeItem(name!);
            break;
          case "0":
            print("Logging out...");
            return;
          default:
            print("Invalid choice.");
        }
      }
    } else {
      print("Incorrect password.");
    }
  } else if (role == "c") {
    stdout.write("Enter your name: ");
    String? name = stdin.readLineSync();
    Customer customer = Customer(name: name!);
    print("\nWelcome $name!");
    customer.displayRole();

    while (true) {
      print("\n[1] View Menu\n[2] Add to Order\n[3] print invoice\n[0] Exit");
      stdout.write("Choice: ");
      String? choice = stdin.readLineSync();

      switch (choice) {
        case "1":
          customer.browseMenu(Restaurant.getMenu());
          break;

        case "2":
          while (true) {
            stdout.write("Enter item name to add (or 'done' to finish): ");
            String? itemName = stdin.readLineSync();
            if (itemName == 'done') break;

            stdout.write("Enter quantity (or press Enter for 1): ");
            String? quantityInput = stdin.readLineSync();

            int? quantity;
            if (quantityInput != null && quantityInput.isNotEmpty) {
              quantity = int.parse(quantityInput);
            }
            quantity ??= 1;
            bool found = false;
            for (int i = 0; i < quantity; i++) {
              var menu = Restaurant.getMenu();
              for (var item in menu) {
                if (item.name == itemName) {
                  customer.addToOrder(item);
                  found = true;
                  break;
                }
              }
            }

            if (found) {
              print("$itemName x$quantity added to order.");
            } else {
              print("Item not found.");
            }
          }

          while (true) {
            print("\nDo you want to:");
            print("[1] Modify an item in the order");
            print("[2] Remove an item from the order");
            print("[0] Continue");

            stdout.write("Your choice: ");
            String? editChoice = stdin.readLineSync();

            if (editChoice == "1") {
              stdout.write("Enter old item name: ");
              String? old = stdin.readLineSync();
              stdout.write("Enter new item name: ");
              String? newName = stdin.readLineSync();
              stdout.write("Enter new price: ");
              double price = double.parse(stdin.readLineSync()!);
              customer.modifyOrder(old!, newName!, price);
            } else if (editChoice == "2") {
              stdout.write("Enter item name to remove: ");
              String? nameToRemove = stdin.readLineSync();
              customer.removeFromOrder(nameToRemove!);
            } else if (editChoice == "0") {
              break;
            } else {
              print("Invalid choice.");
            }
          }
          break;

        case "3":
          await customer.order.printInvoice();
          break;

        case "0":
          print("Thank you for visiting!");
          return;

        default:
          print("Invalid choice.");
      }
    }
  } else {
    print("Invalid role selected.");
  }
}
