import 'dart:io';

// Retrieves the current working directory
Directory getCurrentDirectory() => Directory.current;

// Gets folder path from the user
String? getFolderPath() {
  stdout.write('Enter the path of the folder: ');
  String? folderPath = stdin.readLineSync();
  return folderPath;
}

// Function that returns String in lowerCamelCase for making keys of JSON file
String stringInCamelCase(String lowerCaseString) {
  String trimmedLowerCaseString = lowerCaseString.trim();
  try {
    List<String> splittedStrings = lowerCaseString.split(' ');
    int length = splittedStrings.length;
    if (splittedStrings.length > 1) {
      for (int i = 1; i < length; i++) {
        String initial = splittedStrings[i].substring(0, 1);
        String initialInCapital = initial.toUpperCase();
        splittedStrings[i] =
            splittedStrings[i].replaceFirst(RegExp(initial), initialInCapital);
      }
    }
    String stringInCamelCase = splittedStrings.join();
    return stringInCamelCase;
  } catch (e) {
    print('Error while parsing [ $lowerCaseString ]: ${e.toString()}');
    return trimmedLowerCaseString;
  }
}

// Creates a JSON file in the working directory
File returnFile() {
  Directory currentDirectory = getCurrentDirectory();
  final String path = currentDirectory.path;
  final File file = File('$path/test.json');
  return file;
}
