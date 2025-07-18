class MenuItem {
  String _name;
  double _price;

  MenuItem({required String name, required double price})
    : _name = name,
      _price = price;

  String get name => _name;
  set name(String value) => _name = value;

  double get price => _price;
  set price(double value) => _price = value;

  void display() => print('Food: $_name | Price: \$$_price');
}
