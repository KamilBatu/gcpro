import 'package:flutter_riverpod/flutter_riverpod.dart';

final textControllerProvider =
    StateProvider.family<String, int>((ref, productId) {
  return '1';
});
