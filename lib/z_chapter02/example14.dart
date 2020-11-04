import 'dart:collection';

//Generics methods

//Function's return type (T).
//Function's argument (List<T>).
//Function's local variable (T last).
T lastItem<T>(List<T> products) {
  T last = products.last;
  return last;
}

//A class for grocery product
class Product {
  final int id;
  final double price;
  final String title;
  Product(this.id, this.price, this.title);

  @override
  String toString() {
    return "Price of ${this.title} is \$${this.price}";
  }
}

//A class for product's inventory
class Inventory {
  final int amount;

  Inventory(this.amount);

  @override
  String toString() {
    return "Inventory amount: $amount";
  }
}

//Custom type variables- Single letter
class Store<P, I> {
  final HashMap<P, I> catalog = HashMap<P, I>();

  List<P> get products => catalog.keys.toList();

  void updateInventory(P product, I inventory) {
    catalog[product] = inventory;
  }

  void printProducts() {
    catalog.keys.forEach(
      (product) => print("Product: $product, " + catalog[product].toString()),
    );
  }
}

void main() {
  Store<Product, Inventory> store = Store<Product, Inventory>();
  Product milk = Product(1, 5.99, "Milk");
  Product bread = Product(2, 4.50, "Bread");
  store.updateInventory(milk, Inventory(20));
  store.updateInventory(bread, Inventory(15));

  //Data type of `Product` is being used
  Product product = lastItem(store.products);
  print("Last item of Product type: ${product}");

  //Demonstrating using another type of data on the same `lastItem()` method.
  List<int> items = List<int>.from([1, 2, 3, 4, 5]);
  int item = lastItem(items);
  print("Last item of int type: ${item}");
}
