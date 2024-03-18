import 'dart:io';

// Define a class representing a Person
class Person {
  String name;
  int age;

  // Constructor
  Person(this.name, this.age);

  // Method to display person's details
  void display() {
    print('Name: $name, Age: $age');
  }
}

// Function to read data from file and initialize a Person object
Person? initializePersonFromFile(String filePath) {
  File file = File(filePath);

  try {
    List<String> lines = file.readAsLinesSync();
    if (lines.length == 2) {
      String name = lines[0];
      int age = int.parse(lines[1]);
      return Person(name, age);
    } else {
      print('Invalid data format in file.');
      return null;
    }
  } catch (e) {
    print('Error reading file: $e');
    return null;
  }
}

void main() {
  // Path to the file containing person's data
  String filePath = 'person.txt';

  // Initialize a Person object from file
  Person? person = initializePersonFromFile(filePath);
  
  // Check if person was successfully initialized
  if (person != null) {
    // Display person's details
    person.display();
  } else {
    print('Failed to initialize person from file.');
  }
}
