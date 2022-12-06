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
  try {
    List<String> splittedStrings = lowerCaseString.split(RegExp(r'\s+'));
    int length = splittedStrings.length;
    if (length > 1) {
      for (int i = 1; i < length; i++) {
        String initial = splittedStrings[i].substring(0, 1);
        String initialInCapital = initial.toUpperCase();
        splittedStrings[i] =
            splittedStrings[i].replaceFirst(RegExp(initial), initialInCapital);
      }
      if (lowerCaseString.startsWith(RegExp(r'[0-9]'))) {
        String stringInCamelCase = splittedStrings.join();
        return 'n$stringInCamelCase';
      }
    } else if (lowerCaseString.startsWith(RegExp(r'[0-9]'))) {
      return 'n$lowerCaseString';
    }
    String stringInCamelCase = splittedStrings.join();
    return stringInCamelCase;
  } catch (e) {
    print('Error while parsing [ $lowerCaseString ]: ${e.toString()}');
    String outputString = lowerCaseString.replaceAll(' ', '');
    return outputString;
  }
}

// Creates a JSON file in the working directory
File returnFile() {
  Directory currentDirectory = getCurrentDirectory();
  final String path = currentDirectory.path;
  final File file = File('$path/test.json');
  return file;
}
