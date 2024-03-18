import 'dart:io'; // Import the dart:io library

// Interface
abstract class Animal {
  void makeSound();
}

// Base class
class LivingBeing {
  String name;

  LivingBeing(this.name);

  void breathe() {
    print('$name is breathing');
  }
}

// Subclass implementing the Animal interface
class Dog extends LivingBeing implements Animal {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print('$name barks');
  }

  // Override the breathe method
  @override
  void breathe() {
    super.breathe();
    print('Dog-specific breathing process');
  }
}

// Method to initialize Dog instance from a file
Dog? initializeDogFromFile(String filePath) {
  File file = File(filePath);
  List<String> lines = file.readAsLinesSync();
  if (lines.length >= 1) {
    return Dog(lines[0]);
  }
  return null;
}

// Method demonstrating the use of a loop
void demonstrateLoop() {
  print('Loop demonstration:');
  for (int i = 0; i < 5; i++) {
    print('Iteration $i');
  }
}

void main() {
  // Initialize Dog from file
  Dog? myDog = initializeDogFromFile('dog.txt');
  if (myDog != null) {
    print('Dog initialized from file: ${myDog.name}');
    myDog.makeSound();
    myDog.breathe();
  } else {
    print('Failed to initialize Dog from file.');
  }

  // Demonstrate the use of a loop
  demonstrateLoop();
}
