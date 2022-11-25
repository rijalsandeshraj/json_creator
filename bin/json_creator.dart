/// This is a command line Dart application that reads value of Text widget in Dart files
/// of Flutter project and creates a JSON file especially useful for localization.
///
/// This package intends to help Flutter developers who have already developed
/// a Flutter app and are looking for localizing the project. This package gets
/// and reads all the dart files (if present) from the entered path in the terminal
/// and looks for String value in Text widget and msg argument of 'Fluttertoast' package. Matched
/// strings are then formatted and a JSON file is created with keys in lowerCamelCase and
/// values are the actual matches that the program detected.
///
/// Run this command in the terminal for starting the program:
/// > dart run
///
/// Steps involved while running the program:
/// 1. Run the program
/// 2. Enter the path of the folder where all the Dart files with Text widget are located
/// 3. The program detects whether the entered path exists
/// 4. If the path is valid, then it will display the matched strings in the terminal along
///    with writing path, keys and values to a JSON file named test.json in the working directory

library json_creator;

export '../lib/src/json_creator.dart';
