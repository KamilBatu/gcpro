import 'dart:convert';
import 'dart:io';

void main() {
  final directory = Directory('./lib/features');
  final arbFile = File('./lib/l10n/intl_en.arb');

  if (!arbFile.existsSync()) {
    print('❌ intl_en.arb not found! Run the extraction script first.');
    return;
  }

  // Read the ARB file
  final Map<String, dynamic> translations =
      jsonDecode(arbFile.readAsStringSync()) as Map<String, dynamic>;
  final List<File> dartFiles = [];

  void processFile(File file) {
    final lines = file.readAsLinesSync();
    bool modified = false;

    final updatedLines = lines.map((line) {
      final match =
          RegExp(r'''(['"])([^'"]*?)\1(?=\.hardcoded)''').firstMatch(line);
      if (match != null) {
        final value = match.group(2)!;

        // Convert the original text to the corresponding ARB key
        final key = value
            .toLowerCase()
            .replaceAll(RegExp('[^a-z0-9]+'), '_')
            .replaceAll(RegExp(r'^_+|_+$'), '');

        if (translations.containsKey(key)) {
          modified = true;
          line = line.replaceFirst(
            RegExp("[.]hardcoded"),
            '',
          );
          return line.replaceFirst(
            match.group(0)!,
            'AppLocalizations.of(context).$key',
          );
        } else {
          print(
            '⚠️ Warning: Key "$key" not found in intl_en.arb for "$value"',
          );
        }
      }
      return line;
    }).toList();

    if (modified) {
      file.writeAsStringSync(updatedLines.join('\n'));
    }
  }

  void scanDirectory(Directory dir) {
    for (final entity in dir.listSync(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        dartFiles.add(entity);
      }
    }
  }

  scanDirectory(directory);
  for (final file in dartFiles) {
    processFile(file);
  }

  print('✅ All hardcoded strings replaced with AppLocalizations keys!');
}
