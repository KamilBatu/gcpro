import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier for single selection
class IsOneSelectedNotifier extends StateNotifier<bool> {
  IsOneSelectedNotifier() : super(true); // Initialize with default value

  void toggle() {
    state = !state;
  }
}

// StateNotifierProvider with family for single selection
final isOneSelectedProvider =
    StateNotifierProvider.family<IsOneSelectedNotifier, bool, int>(
  (ref, productId) => IsOneSelectedNotifier(),
);

class IsAllSelectedNotifier extends StateNotifier<bool> {
  IsAllSelectedNotifier() : super(true);

  void toggle(WidgetRef ref) {
    state = !state;
  }
}

// Provider for all items selection
final isAllSelectedProvider =
    StateNotifierProvider<IsAllSelectedNotifier, bool>(
  (ref) => IsAllSelectedNotifier(),
);

// StateNotifier for all items selection
class ToggleNotifier extends StateNotifier<bool> {
  ToggleNotifier() : super(true); // Initialize with default value

  void toggle() {
    state = !state;
  }
}

//for toggling ui
class SelectedNotifier extends StateNotifier<bool> {
  SelectedNotifier() : super(true); // Initialize with default value

  void toggle() {
    state = !state;
  }
}

// Provider for all items selection
final toggleNotifierProvider = StateNotifierProvider<SelectedNotifier, bool>(
  (ref) => SelectedNotifier(),
);
