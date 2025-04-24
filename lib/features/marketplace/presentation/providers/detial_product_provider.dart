import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

final favoriteProvider = NotifierProvider<FavoriteNotifier, bool>(() {
  return FavoriteNotifier();
});

void toggleFav(WidgetRef ref) {
  ref.read(favoriteProvider.notifier).toggle();
}
