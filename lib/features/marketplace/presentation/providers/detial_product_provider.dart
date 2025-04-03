import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider = StateProvider<bool>((ref) {
  return false;
});

void toggleFav(WidgetRef ref) {
  final currentState = ref.read(favoriteProvider.notifier).state;
  ref.read(favoriteProvider.notifier).state = !currentState; // Invert the state
}
