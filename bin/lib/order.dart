import 'menuitem.dart';

class Order {
  final List<MenuItem> items = [];

  void addItem(MenuItem item) {
    items.add(item);
    // print("${item.name} added to order.");
  }

  void removeItem(String itemName) {
    items.removeWhere((item) => item.name == itemName);
    print("$itemName removed from order.");
  }

  void updateItem(String oldName, String newName, double newPrice) {
    for (var item in items) {
      if (item.name == oldName) {
        item.name = newName;
        item.price = newPrice;
        print("$oldName updated to $newName - \$$newPrice");
        return;
      }
    }
    print("Item not found.");
  }

  void updateItemWithCascade(String oldName, String newName, double newPrice) {
    for (var item in items) {
      if (item.name == oldName) {
        item
          ..name = newName
          ..price = newPrice;
        print("Updated using cascading: $oldName =>$newName - \$$newPrice");
        return;
      }
    }
    print("Item not found.");
  }

  double calculateTotal() {
    double total = 0;

    final uniqueItems = items.toSet();

    for (var item in uniqueItems) {
      int qty = items.where((e) => e.name == item.name).length;
      total += item.price * qty;
    }

    return total;
  }

  Future<void> printInvoice() async {
    print("\nGenerating invoice...");
    await Future.delayed(Duration(seconds: 2));

    if (items.isEmpty) {
      print("Invoice is empty. No items.");
    } else {
      print("\n========== INVOICE ==========");

      final uniqueItems = items.toSet();

      for (var item in uniqueItems) {
        int qty = items.where((e) => e.name == item.name).length;
        double total = item.price * qty;
        print("- ${item.name} x$qty = \$${total}");
      }

      print("Total: \$${calculateTotal()}");
      print("=============================\n");
    }
  }
}
