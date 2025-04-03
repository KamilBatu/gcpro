import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({
    super.key,
    this.full = false,
  });

  final bool full;

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    return Row(
      children: [
        Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(color: onSurface, borderRadius: BorderRadius.circular(50)),),
        Expanded(child: Container(height: 1.5, color: onSurface)),
        Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                border: full ? null : Border.all(color: Colors.grey),
                color: full ? onSurface : Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(50),),),
      ],
    );
  }
}
