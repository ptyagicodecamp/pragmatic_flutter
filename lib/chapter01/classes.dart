class Person {
  String name;
  int age;
  String food;

  // Short-form constructor
  Person(this.name, [this.age]);

  // Named constructor
  Person.basicInfo({this.name, this.age});

  // Getter
  String get personName => this.name;

  // Setter
  set personName(String value) => this.name = value;

  //Method
  void eats(String food) {
    this.food = food;
  }

  //Overriding method from Object
  String toString() {
    return "My name is $name, and I like to eat $food";
  }
}

void main() {
  Person person = Person("Priyanka");
  print(person.toString());

  Person child = Person.basicInfo(name: "Krisha", age: 6);
  child.eats("Pizza");
  print(child.toString());

  child
    ..name = 'Kalp'
    ..eats("Pasta");
  print(child.toString());

  child
    ..personName = 'Tanmay'
    ..eats("Pesto");
  print(child.toString());
}
