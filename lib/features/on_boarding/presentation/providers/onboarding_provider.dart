import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

class OnboardingScreenData {
  const OnboardingScreenData({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String description;
  final String image;
}

const List<OnboardingScreenData> onboardingData = [
  OnboardingScreenData(
    title: 'Get your',
    subTitle: 'Dream Job',
    description: 'Effortless inventory management for your business.',
    image: 'assets/images/onboarding1.png',
  ),
  OnboardingScreenData(
    title: 'Entertainment',
    subTitle: 'Stream & Chat',
    description:
        'Dive into the ultimate entertainment experience with our live chat and streaming platform!',
    image: 'assets/images/onboarding2.png',
  ),
  OnboardingScreenData(
    title: 'Elevate your',
    subTitle: 'Business',
    description:
        'Elevate your business to new heights with our tailored promotional strategies! Reach your target audience, boost your brand visibility, and drive growth like never before—let us help you turn potential into profit.',
    image: 'assets/images/onboarding3.png',
  ),
];

@riverpod
class OnboardingIndex extends _$OnboardingIndex {
  @override
  int build() => 0;

  void next() {
    state = (state + 1) % onboardingData.length;
  }

  void previous() {
    state = (state - 1) % onboardingData.length;
  }

  void skip() {
    state = onboardingData.length - 1;
  }

  set toIndex(int index) => state = index;
  int get toIndex => state;
}

final onboardingScreenDataProvider =
    AutoDisposeStateProvider<OnboardingScreenData>(
  (ref) {
    final index = ref.watch(onboardingIndexProvider);
    return onboardingData[index];
  },
  name: 'onboardingScreenDataProvider',
);
