import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gcpro_design_system/tokens/colors.dart';

class RadioOption<T> extends ConsumerWidget {
  const RadioOption({
    required this.value,
    required this.groupValueProvider,
    required this.onChanged,
    required this.titleBuilder,
    super.key,
  });

  final T value;
  final AutoDisposeStateProvider<T> groupValueProvider;
  final void Function(T) onChanged;
  final String Function(T) titleBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupValue = ref.watch(groupValueProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceDim,
          borderRadius: BorderRadius.circular(15),
        ),
        child: RadioListTile<T>(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            titleBuilder(value),
            style: TextStyle(
              fontSize: 12.5,
              color: groupValue == value
                  ? Theme.of(context).colorScheme.onSurface
                  : Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight:
                  groupValue == value ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          value: value,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          groupValue: groupValue,
          onChanged: (newValue) {
            if (newValue != null) onChanged(newValue);
          },
          activeColor: kColorSchemeSeed,
        ),
      ),
    );
  }
}
