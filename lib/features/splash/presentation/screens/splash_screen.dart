import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/splash/presentation/providers/splash_provider.dart';
import 'package:gcpro/features/splash/presentation/screens/animated_intro.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = '/splashScreen';

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final router = AutoRouter.of(context);
    Future.delayed(const Duration(milliseconds: 5500), () async {
      final isUserLoggedIn = await ref.read(tokenCheckProvider.future);
      final route = isUserLoggedIn
          ? const DashboardRoute()
          : await ref.read(firstTimeCheckProvider.future)
              ? OnboardingRoute()
              : const LoginRoute();
      await router.pushAndPopUntil(
        route as PageRouteInfo,
        predicate: (_) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const AnimatedIntro();
  }
}
