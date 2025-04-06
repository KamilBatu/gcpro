import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/auth/presentation/screens/test_auth_screen/register_screen_test.dart';
import 'package:gcpro/features/on_boarding/presentation/providers/onboarding_provider.dart';
import 'package:gcpro/features/on_boarding/presentation/screens/board_screen.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:gcpro/shared/domain/providers/secured_storage_service_provider.dart';
import 'package:gcpro/shared/globals.dart';
import 'package:gcpro/shared/utils/change_route.dart';
import 'package:gcpro/shared/widgets/localization_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends ConsumerWidget {
  OnboardingScreen({super.key});
  static const String routeName = '/onboardingScreen';
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Define color variables
    final Color activeDotColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          const Gap(12),
          TextButton(
            onPressed: () {
              ref
                  .read(secureStorageServiceProvider)
                  .set(FIRST_TIME_KEY, 'false');
              goTo(const SignupRoute(), context);
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => SignupScreenTest()));
            },
            child: const Text(
              'Skip',
              style: TextStyle(fontSize: 13),
            ),
          ),
          const Spacer(),
          const ChooseLocalization(),
          const Gap(12),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onboardingData.length,
              controller: pageController,
              onPageChanged: (value) =>
                  ref.read(onboardingIndexProvider.notifier).toIndex,
              itemBuilder: (context, index) =>
                  BoardScreen(data: onboardingData[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedSmoothIndicator(
                  activeIndex: ref.watch(onboardingIndexProvider),
                  count: onboardingData.length,
                  onDotClicked: (index) {
                    ref.read(onboardingIndexProvider.notifier).toIndex;
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  effect: ExpandingDotsEffect(
                    dotColor: activeDotColor.withAlpha(100),
                    activeDotColor: activeDotColor,
                    dotWidth: 7,
                    dotHeight: 7,
                    expansionFactor: 4,
                    spacing: 4,
                  ),
                ),
                NextButton(pageController: pageController),
              ],
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}

class NextButton extends ConsumerWidget {
  const NextButton({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(onboardingIndexProvider);
    final totalPages = onboardingData.length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 75,
            height: 75,
            child: CircularProgressIndicator(
              value: (currentPage + 1) / totalPages,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context)
                    .colorScheme
                    .onSurfaceVariant
                    .withAlpha((0.45 * 255).toInt()),
              ),
              strokeWidth: 3,
            ),
          ),
          IconButton.filled(
            onPressed: () {
              if (currentPage == totalPages - 1) {
                ref
                    .read(secureStorageServiceProvider)
                    .set(FIRST_TIME_KEY, 'false');
                goTo(const SignupRoute(), context);
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => SignupScreenTest()));
                return;
              }

              ref.read(onboardingIndexProvider.notifier).next();
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            icon: const Icon(Icons.arrow_forward_ios_outlined),
            iconSize: 25,
            padding: const EdgeInsets.all(18),
          ),
        ],
      ),
    );
  }
}
