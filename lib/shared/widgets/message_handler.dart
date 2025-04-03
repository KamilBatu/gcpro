import 'package:gcpro/shared/domain/providers/global_error_provider.dart';
import 'package:gcpro/shared/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalErrorHandler extends StatelessWidget {
  const GlobalErrorHandler({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        ref.listen<GlobalErrorState>(
          globalErrorProvider,
          (previous, next) {
            if (next.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    next.errorMessage,
                    style: const TextStyle(color: Colors.white),
                  ),
                  duration: const Duration(milliseconds: SNACK_BAR_DURATION),
                ),
              );
            }
          },
        );

        return child;
      },
    );
  }
}
