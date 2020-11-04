import 'dart:collection';

//Demonstrating use of descriptive words for generics

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

//Descriptive words paramters for generics
class MyStore<MyProduct, MyInventory> {
  final HashMap<MyProduct, MyInventory> catalog =
      HashMap<MyProduct, MyInventory>();

  List<MyProduct> get products => catalog.keys;

  void updateInventory(MyProduct product, MyInventory inventory) {
    catalog[product] = inventory;
  }

  void printProducts() {
    catalog.keys.forEach(
      (product) => print("Product: $product, " + catalog[product].toString()),
    );
  }
}

//Demonstrating descriptive names for generics.
void main() {
  Product milk = Product(1, 5.99, "Milk");
  Product bread = Product(2, 4.50, "Bread");

  //Using descriptive names for Generics
  MyStore<Product, Inventory> store2 = MyStore<Product, Inventory>();
  store2.updateInventory(milk, Inventory(20));
  store2.updateInventory(bread, Inventory(15));
  store2.printProducts();
}
