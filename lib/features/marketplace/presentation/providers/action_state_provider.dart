import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final textControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

// Define the provider with proper typing
final numberProvider = StateProvider<int>((ref) => 1);

// Add function with explicit return type
void addQuantity(WidgetRef ref) {
  final currentNotifier = ref.read(numberProvider);
  final newValue = currentNotifier + 1;
  ref.watch(numberProvider.notifier).state = newValue;
  ref.watch(textControllerProvider).text = newValue.toString();
}

// Remove functi with explicit return type and cleaner logic
void removeQuantity(WidgetRef ref) {
  final currentNotifier = ref.read(numberProvider);
  final newValue = currentNotifier - 1 > 1 ? currentNotifier - 1 : 1;
  ref.watch(numberProvider.notifier).state = newValue;
  ref.watch(textControllerProvider).text = newValue.toString();
}
