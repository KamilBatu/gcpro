import 'dart:async';
import 'package:animations/animations.dart';
import 'package:gcpro_design_system/gcpro_design_sysytem.dart';
import 'package:gcpro/features/auth/presentation/screens/login_screen.dart';
import 'package:gcpro/features/home/presentation/screens/home_screen.dart';
import 'package:gcpro/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:gcpro/features/splash/presentation/providers/splash_provider.dart';
import 'package:gcpro/gen/assets.gen.dart';
import 'package:gcpro/main/app_env.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimatedIntro extends StatefulWidget {
  const AnimatedIntro({super.key});

  @override
  AnimatedIntroState createState() => AnimatedIntroState();
}

class AnimatedIntroState extends State<AnimatedIntro> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OpenContainer(
              closedBuilder: (_, openContainer) {
                if (!_isOpen) {
                  Timer(
                    const Duration(milliseconds: 1500),
                    () => openContainer(),
                  );
                  _isOpen = true;
                }
                return SizedBox(
                  height: 120,
                  width: 120,
                  child: Center(
                    child: Assets.images.logoPrimary.image(),
                  ),
                );
              },
              transitionType: ContainerTransitionType.fadeThrough,
              routeSettings: const RouteSettings(name: '/splashScreen'),
              useRootNavigator: true,
              tappable: false,
              closedElevation: 0,
              closedColor: Colors.transparent,
              transitionDuration: const Duration(milliseconds: 700),
              openBuilder: (_, closeContainer) {
                return const SecondScreen();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends ConsumerStatefulWidget {
  const SecondScreen({super.key});

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends ConsumerState<SecondScreen> {
  bool _a = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 700), () {
      setState(() {
        _a = !_a;
      });
    });
    Timer(const Duration(milliseconds: 2000), () async {
      final router = Navigator.of(context);
      final isUserLoggedIn = await ref.read(tokenCheckProvider.future);
      final route = isUserLoggedIn
          ? const HomeScreen()
          : await ref.read(firstTimeCheckProvider.future)
              ? OnboardingScreen()
              : const LoginScreen();
      await router.pushReplacement(SlideTransitionAnimation(route));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _a ? width : 0,
            height: height,
            color: kColorSchemeSeed,
          ),
          Center(
            child: Text(
              EnvInfo.appName,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _a ? width : 0,
            height: height,
            color: kColorSchemeSeed,
          ),
          Center(
            child: Text(
              EnvInfo.appName,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideTransitionAnimation extends PageRouteBuilder<void> {
  SlideTransitionAnimation(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return SlideTransition(
              position: Tween(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              textDirection: TextDirection.rtl,
              child: page,
            );
          },
        );
  final Widget page;
}
