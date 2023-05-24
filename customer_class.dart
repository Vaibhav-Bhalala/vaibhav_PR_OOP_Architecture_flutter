import 'item_class.dart';

class Customer {
  int id;
  String name;
  String mobileNumber;
  List<Item> cart;

  Customer(this.id, this.name, this.mobileNumber) : cart = <Item>[];

  void displayCart() {
    print('Customer ID: $id');
    print('Name: $name');
    print('Mobile Number: $mobileNumber');
    print('Cart:\n');

    if (cart.isEmpty) {
      print('Cart is empty.\n');
    } else {
      for (var item in cart) {
        print('Item ID: ${item.id}');
        print('Name: ${item.name}');
        print('Price: /-${item.price.toStringAsFixed(2)}');
        print('-------------------');
      }
    }
  }
}