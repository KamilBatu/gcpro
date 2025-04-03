import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final logProvider = Provider<Logger>(
  (ref) {
    return Logger(
      printer: PrettyPrinter(
        methodCount: 1,
        errorMethodCount: 5,
        lineLength: 100,
      ),
    );
  },
  name: 'logProvider',
);
