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

//Restricting the type of values that can be supplied to the class.
//FreshProduce class can only accept of Product type when T extends Product
class FreshProduce<T extends Product> {
  FreshProduce(int i, double d, String s);

  String toString() {
    return "Instance of Type: ${T}";
  }
}

void main() {
  //Using `Product` parameter accepted by FreshProduce class
  FreshProduce<Product> spinach = FreshProduce<Product>(3, 3.99, "Spinach");
  print(spinach.toString());

  //Passing
  FreshProduce spinach2 = FreshProduce(3, 3.99, "Spinach");
  print(spinach2.toString());

  //This code will give compile time error complaining that Object is not of type Product
  //FreshProduce<Object> spinach3 = FreshProduce<Object>(3, 3.99, "Spinach");
  //print(spinach3.toString());
}
