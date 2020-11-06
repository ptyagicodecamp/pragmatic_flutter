// Named function
bool isFlutter(String str) {
  return str == 'Flutter';
}

// Function with optional parameters in brackets
String concat(String str1, [String str2]) {
  return str2 != null ? "$str1 $str2" : str1;
}

// Named Parameters: Function with optional parameters in curly braces
String concat2(String str1, {String str2}) {
  return str2 != null ? "$str1 $str2" : str1;
}

// Passing Function as parameter
int calculate(int value1, int value2, Function(int, int) function) {
  return function(value1, value2);
}

int subtract(int a, int b) {
  return a > b ? a - b : b - a;
}

// Arrow Syntax
int add(int a, int b) => a + b;

// Anonymous Function
Function anonymousAdd = (int a, int b) {
  return a + b;
};

void main() {
  dynamic result;

  // Using Named Function
  result = isFlutter("Flutter");
  print(result);

  // Using function with optional params with brackets []
  result = concat("Priyanka", "Tyagi");
  print(result);

  // Using function with optional params with curly braces{}
  result = concat2("Priyanka", str2: "Tyagi");
  print(result);

  //Passing function `subtract` as parameter
  result = calculate(5, 4, subtract);
  print(result);

  // Using Arrow Syntax
  result = add(5, 4);
  print(result);

  // Using anonymous functions.
  // Calling function variable `anonymousAdd`
  result = anonymousAdd(4, 5);
  print(result);
}
