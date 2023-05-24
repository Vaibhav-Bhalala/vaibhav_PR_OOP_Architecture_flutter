import 'customer_class.dart';
import 'item_class.dart';
import 'dart:io';

class Supermarket {
  List<Item> items;
  List<Customer> customers;

  Supermarket()
      : items = [],
        customers = [];

  void displayItems() {
    if (items.isEmpty) {
      print('No items available.\n');
    } else {
      print('Available Items:\n');
      for (var item in items) {
        print('Item ID: ${item.id}');
        print('Name: ${item.name}');
        print('Price: /-${item.price.toStringAsFixed(2)}');
        print('-------------------');
      }
    }
  }

  void newCustomer() {
    stdout.write('Enter Customer ID: ');
    int id = int.parse(stdin.readLineSync()!);
    stdout.write('Enter Customer Name: ');
    String name = stdin.readLineSync()!;
    stdout.write('Enter Customer Mobile Number: ');
    String mobileNumber = stdin.readLineSync()!;

    customers.add(Customer(id, name, mobileNumber));
    print('Customer added successfully.\n');
  }

  void addItemToCart(Customer customer) {
    displayItems();

    stdout.write('Enter Item ID: ');
    int itemId = int.parse(stdin.readLineSync()!);
    Item? item = items.firstWhere((item) => item.id == itemId);

    stdout.write('Enter Quantity: ');
    int quantity = int.parse(stdin.readLineSync()!);
    double totalPrice = item.price * quantity;

    customer.cart.add(Item(item.id, item.name, totalPrice));
    print('Item added to cart successfully.\n');
  }

 void generateBill(Customer customer) {
  if (customer.cart.isEmpty) {
    print('Customer cart is empty.\n');
  } else {
    double totalAmount = 0;

    print('Customer ID: ${customer.id}');
    print('Name: ${customer.name}');
    print('Mobile Number: ${customer.mobileNumber}');
    print('-------------------');
    print('Items Purchased:\n');

    for (var item in customer.cart) {
      print('Item ID: ${item.id}');
      print('Name: ${item.name}');
      print('Price: /-${item.price.toStringAsFixed(2)}');

     
      double discountedPrice = applyDiscount(item.price);
      totalAmount += discountedPrice;

      print('Discounted Price: /-${discountedPrice.toStringAsFixed(2)}');
      print('-------------------');
    }

    print('Total Amount: /-${totalAmount.toStringAsFixed(2)}\n');
  }
}

double applyDiscount(double price) {
  double discountedPrice = price;

  if (price >= 500 && price < 1500) {
    discountedPrice *= 0.9; 
  } else if (price >= 1500 && price < 3500) {
    discountedPrice *= 0.8; 
  } else if (price >= 3500 && price < 6500) {
    discountedPrice *= 0.75;
  } else {
    discountedPrice *= 0.7; 
  }

  return discountedPrice;
}


  void searchCustomerById() {
    stdout.write('Enter Customer ID: ');
    int customerId = int.parse(stdin.readLineSync()!);

    Customer? customer;
    for (var c in customers) {
      if (c.id == customerId) {
        customer = c;
        break;
      }
    }

    if (customer != null) {
      customer.displayCart();
      generateBill(customer);
    } else {
      print('Customer not found.');
    }
  }
}
