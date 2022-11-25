# JSON_CREATOR for Flutter Apps

This is a command line Dart application that reads value of Text widget in Dart files
of Flutter project and creates a JSON file especially useful for localization.

This package intends to help Flutter developers who have already developed
a Flutter app and are looking for localizing the project. This package gets
and reads all the Dart files (if present) from the entered path in the terminal
and looks for String value in Text widget and msg argument of 'Fluttertoast' package. Matched
strings are then formatted and a JSON file is created with keys in lowerCamelCase and
values are the actual matches that the program detected.

## Usage

This program is published to pub.dev so you can use this package:

1. As an executable by running the following commands:

```ps
dart pub global activate json_creator
```

<img src="https://github.com/rijalsandeshraj/json_creator/raw/main/screenshots/path_warning.png" />

If the warning is shown, you need to add the highlighted directory to your system's "Path"
environment variable for allowing the executable to run. Run the following command after adding
the directory to path.

```ps
json_creator
```

2. Or, by cloning the source code to your local machine and running the following command:

```ps
dart run
```

<img src="https://github.com/rijalsandeshraj/json_creator/raw/main/screenshots/get_started.png" />

## Steps involved while running the program

1. Run the program
2. Enter the path of the folder where all the Dart files with Text widget are located
3. The program detects whether the entered path exists
4. If the path is valid, then it will display the matched strings in the terminal along
   with writing path, keys and values to a JSON file named test.json in the working directory

## Output

The output JSON file is created in the working directory as 'test.json'.

<img src="https://github.com/rijalsandeshraj/json_creator/raw/main/screenshots/output.png" />

For your convenience, the path above keys and values identifies the file from which
they were extracted.

## Additional Information

Use Prettier extension to format your JSON file. Edit the file whereever necessary. Add this
to settings.json to format JSON files:

```console
"[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
```

Since writing comments within a json is not possible and localization is done using \*.arb files,
you can convert the extension of the JSON file to .arb. There is a syntax for defining comments in
those files. The community suggests using a special syntax, e.g. "@\_LOGIN_PAGE": {}, as a convention
of writing comments, but you can imagine they are not very visible when the file grows. So there's a
way out to highlight those section titles by using a VS Code extension: Highlight.

Just install it, go to settings.json, and add the following entry under highlight.regexes:

```console
"highlight.regexes": {
   "(\"@_.+\": {},)": {
     "filterFileRegex": ".*\\.(arb|json)",
     "decorations": [
       {
         "overviewRulerColor": "#d19a66",
         "backgroundColor": "#d19a66",
         "color": "#282c34",
         "fontWeight": "bold"
       }
     ]
   }
 }
```

Now the path of the file from where the keys and values were extracted gets highlighted!

There's an interesting article that can be helpful when working with arb files for localization. You
can check this out:
https://yapb.dev/tips-and-tricks-13-tips-when-working-with-arb-files-for-localization

Use the package and feedback is welcome! :blush::sparkling_heart:
