/// List

List emptyList = [];

List theList = ['Dart', 'Kotlin'];
//null list
List theNullList;

// Spread operator ... - Flatten the list and to be merged with another list
// Null spread operator ...? - Helps to avoid runtime exceptions - iterator called on null.
List anotherList = ['Java', ...theList, ...?theNullList];

/// Set
// Creating Set of String
Set langSet = {'Dart', 'Kotlin', 'Swift'};
Set sdkSet = {'Flutter', 'Android', 'iOS'};

/// Map
// Creating a Map of int key and String value.
var intToStringMap = Map<int, String>();

// Creating Map of String key and String value.
var techMap = {
  'Flutter': 'Dart',
  'Android': 'Kotlin',
  'iOS': 'Swift',
};

void main() {
  dynamic result;

  print('==== List ====');
  //Check if list is empty
  result = emptyList.isEmpty;
  print(result);

  // Printing the merged list created using spread operators
  print(anotherList);

  // Using `map` to transform the items of List.
  // All items will be suffixed with 'Language'.
  result = theList.map((e) => "$e Language").toList();
  print(result);

  // Filtering: Filter words containing letter 'a'
  result = theList.where((element) => element.toString().contains('a'));
  print(result); // Dart contains letter 'a'

  // Set
  print('==== Set ====');
  // Adding 'Java' to Set
  langSet.add('Java');
  print(langSet);

  // Remove Java from Set
  langSet.remove('Java');
  print(langSet);

  // Adding multiple items to each set
  langSet.addAll(['C#', 'Java']);
  sdkSet.addAll(['C#', 'Xamarin']);
  print(langSet);
  print(sdkSet);

  // Find Intersection of two sets (common items)
  result = langSet.intersection(sdkSet);
  print(result); // C#

  // Find Union of two sets. No duplicates.
  result = langSet.union(sdkSet);
  print(result);

  // Map
  print('==== Map ====');
  intToStringMap[1] = '1';
  intToStringMap[2] = '2';

  // first Map entry
  result = intToStringMap.entries.first;
  print(result);

  // last Map entry
  result = intToStringMap.entries.last;
  print(result);

  // Returns boolean. true if key is found, otherwise false
  result = techMap.containsKey('Flutter');
  print(result);

  // Checking if value is present in the Map
  result = techMap.containsValue('Dart');
  print(result);

  // Prints all values
  techMap.values.forEach((element) {
    print("$element");
  });

  // Iterates over all key-value pairs and prints them
  techMap.entries.forEach((element) {
    print(
        "${element.value} is used for developing ${element.key} applications.");
  });
}
