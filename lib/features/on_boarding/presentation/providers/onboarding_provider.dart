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
    title: 'Streamline',
    subTitle: 'Your Pharmacy',
    description:
        'Effortless inventory management for pharmacies and wholesalers. Track stock, manage orders, and optimize supply chains with ease.',
    image: 'assets/images/onboarding1.png',
  ),
  OnboardingScreenData(
    title: 'Connect',
    subTitle: 'With Suppliers',
    description:
        'Seamlessly connect with trusted pharmacy wholesalers. Access real-time pricing, order updates, and exclusive deals on medications and supplies.',
    image: 'assets/images/onboarding2.png',
  ),
  OnboardingScreenData(
    title: 'Grow Your',
    subTitle: 'Pharmacy Business',
    description:
        'Boost your pharmacy’s success with tailored analytics and insights. Enhance customer satisfaction, optimize operations, and drive profitability.',
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
