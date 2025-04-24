import 'dart:convert';
import 'dart:io';

void main() {
  final directory = Directory('./lib/features');
  final jsonFile = File('./lib/l10n/en.json');
  final Map<String, String> extractedStrings = {};

  void processFile(File file) {
    final lines = file.readAsLinesSync();
    for (final line in lines) {
      final match =
          RegExp(r'''(['"])([^'"]*?)\1(?=\.hardcoded)''').firstMatch(line);

      if (match != null) {
        final value = match.group(2)!;
        final key = value.toLowerCase().replaceAll(RegExp('[^a-z0-9]+'), '_');
        extractedStrings[key] = value;
      }
    }
  }

  void scanDirectory(Directory dir) {
    for (final entity in dir.listSync(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        processFile(entity);
      }
    }
  }

  scanDirectory(directory);

  // Append to JSON file
  final existingContent =
      jsonFile.existsSync() ? jsonFile.readAsStringSync() : '{}';
  final existingJson = jsonDecode(existingContent) as Map<String, dynamic>
    ..addAll(extractedStrings);
  jsonFile.writeAsStringSync(jsonEncode(existingJson));

  print('✅ Extracted ${extractedStrings.length} strings to en.json');
}
