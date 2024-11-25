import 'dart:io';
import 'package:intl/intl.dart'; // For formatting dates

//STRING MANIPULATION
Future<void> main() async {
  // Original strings
  String str1 = "Hello";
  String str2 = "World";

  // Concatenation
  String concatenated = "$str1 $str2";
  print("Concatenated String: $concatenated");

  // Reversing a string
  String reversed = str1.split('').reversed.join('');
  print("Reversed '$str1': $reversed");

  // Changing cases
  String upperCase = str1.toUpperCase();
  String lowerCase = str2.toLowerCase();
  print("Uppercase of '$str1': $upperCase");
  print("Lowercase of '$str2': $lowerCase");

  // Mixing operations
  String mixed = reversed.toLowerCase() + " " + upperCase;
  print("Mixed Operations Result: $mixed");

//COLLECTIONS
  // Using a List (ordered and allows duplicates)
  List<String> fruits = ['Apple', 'Banana', 'Cherry', 'Apple'];
  print("Original List: $fruits");
  fruits.add('Mango'); // Adding an item
  print("After Adding: $fruits");
  print("First Fruit: ${fruits[0]}"); // Accessing by index
  print("Unique Fruits (converted to Set): ${fruits.toSet()}");

  // Using a Set (unordered and unique values)
  Set<String> uniqueFruits = {'Apple', 'Banana', 'Cherry'};
  print("\nOriginal Set: $uniqueFruits");
  uniqueFruits.add('Mango'); // Adding an item
  uniqueFruits.add('Apple'); // Adding duplicate (no effect)
  print("After Adding: $uniqueFruits");
  print(
      "Contains 'Banana': ${uniqueFruits.contains('Banana')}"); // Checking existence

  // Using a Map (key-value pairs)
  Map<String, int> fruitPrices = {'Apple': 3, 'Banana': 1, 'Cherry': 5};
  print("\nOriginal Map: $fruitPrices");
  fruitPrices['Mango'] = 2; // Adding a new key-value pair
  print("After Adding Mango: $fruitPrices");
  print("Price of Banana: \$${fruitPrices['Banana']}");
  fruitPrices.remove('Apple'); // Removing a key-value pair
  print("After Removing Apple: $fruitPrices");

  // Combining collections
  List<String> mapKeys = fruitPrices.keys.toList(); // Extract keys as a list
  print("\nKeys as List: $mapKeys");

  //FILE HANDLING

  String inputFilePath = 'input.txt';
  String outputFilePath = 'output.txt';

  try {
    // Reading content from the input file
    File inputFile = File(inputFilePath);
    if (await inputFile.exists()) {
      String content = await inputFile.readAsString();
      print("Content of '$inputFilePath':\n$content");

      // Writing content to the output file
      File outputFile = File(outputFilePath);
      await outputFile.writeAsString(content);
      print("\nContent successfully written to '$outputFilePath'.");
    } else {
      print("Error: '$inputFilePath' does not exist.");
    }
  } on FileSystemException catch (e) {
    // Handling file-related errors
    print("FileSystemException: ${e.message}");
  } catch (e) {
    // Handling other unexpected errors
    print("An unexpected error occurred: $e");
  }

  //DATE AND TIME

  // Getting the current date and time
  DateTime now = DateTime.now();
  print("Current Date and Time: $now");

  // Formatting dates
  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  String formattedTime = DateFormat('HH:mm:ss').format(now);
  print("Formatted Date: $formattedDate");
  print("Formatted Time: $formattedTime");

  // Parsing a string into a DateTime object
  String dateString = "2024-12-01";
  DateTime parsedDate = DateTime.parse(dateString);
  print("Parsed Date: $parsedDate");

  // Adding and subtracting time
  DateTime oneWeekLater = now.add(Duration(days: 7));
  DateTime oneWeekEarlier = now.subtract(Duration(days: 7));
  print("One Week Later: $oneWeekLater");
  print("One Week Earlier: $oneWeekEarlier");

  // Calculating the difference between two dates
  Duration difference = parsedDate.difference(now);
  print("Days until $dateString: ${difference.inDays}");

  // Getting specific parts of a DateTime
  int year = now.year;
  int month = now.month;
  int day = now.day;
  int hour = now.hour;
  int minute = now.minute;
  int second = now.second;
  print(
      "Year: $year, Month: $month, Day: $day, Hour: $hour, Minute: $minute, Second: $second");
}
