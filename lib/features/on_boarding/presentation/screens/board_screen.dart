import 'package:gcpro/features/on_boarding/presentation/providers/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({
    required this.data,
    super.key,
  });

  final OnboardingScreenData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(30),
        Expanded(child: Image.asset(data.image)),
        Details(data: data),
      ],
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    required this.data,
    super.key,
  });

  final OnboardingScreenData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(data.subTitle, style: Theme.of(context).textTheme.displayLarge),
          const Gap(20),
          Text(
            data.description,
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
