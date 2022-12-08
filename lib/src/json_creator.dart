import 'dart:io';

import 'utils.dart';

void main() {
  String? folderPath = getFolderPath();
  if (folderPath != null && folderPath.isNotEmpty) {
    Directory dir = Directory(folderPath);
    bool dirStatus = dir.existsSync();
    // Checking whether the directory exists
    if (dirStatus) {
      List<FileSystemEntity> contents = dir
          .listSync(
            recursive: true,
            followLinks: false,
          )
          .where((e) => e.path.endsWith('.dart'))
          .toList();
      if (contents.isNotEmpty) {
        File outputFile = returnFile();
        outputFile.writeAsStringSync(
          '{\n',
          mode: FileMode.append,
        );
        for (FileSystemEntity file in contents) {
          if (file is File) {
            print('🔰 ${file.path}');
            String formattedPath = file.path
                .replaceAll(RegExp(r'^[a-zA-Z]:[\\/]'), '')
                .replaceAll(RegExp(r'[\\/]'), '>');
            final String content = file.readAsStringSync();
            RegExp exp = RegExp(
                r'''(Text(Widget)?|msg)[(:]\r?\n?\s*['"]+[!"#%&'*/\\,-.;<>=@\[\]^_`~\w\s\r\n]+[?]?['"]+''',
                multiLine: true);
            RegExp replaceExp = RegExp(
                r'''(Text(Widget)?|msg)[(:]\r?\n?\s*['"]+''',
                multiLine: true);
            RegExp secondReplaceExp = RegExp(r'''['"]+$''');
            Iterable<Match> matches = exp.allMatches(content);
            if (matches.isNotEmpty) {
              print('✅ MATCHES: ${matches.length}\n'
                  '========================================');
              outputFile.writeAsStringSync(
                "  \"@_$formattedPath\": {},\n",
                mode: FileMode.append,
              );
              for (final Match m in matches) {
                String actualMatch = m[0]!
                    .replaceAll(replaceExp, '')
                    .replaceAll(secondReplaceExp, '');
                String matchInLowerCase = actualMatch
                    .toLowerCase()
                    .replaceAll(RegExp(r'''[^\w\s]'''), ' ')
                    .trim();
                String matchInCamelCase = stringInCamelCase(matchInLowerCase);
                print('$matchInCamelCase => $actualMatch');
                outputFile.writeAsStringSync(
                  '  "$matchInCamelCase": "$actualMatch",\n',
                  mode: FileMode.append,
                );
              }
              print('========================================\n');
            } else {
              print('❌ NO MATCHES!\n');
            }
          }
        }
        outputFile.writeAsStringSync(
          '}',
          mode: FileMode.append,
        );
      } else {
        print('❗ Directory has no contents!');
      }
    } else {
      print('❗ Directory does not exist!');
    }
  } else {
    print('❗ You didn\'t enter the path!');
  }
}
