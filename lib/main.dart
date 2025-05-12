import 'package:gcpro/main/app.dart';
import 'package:gcpro/main/app_env.dart';
import 'package:gcpro/main/observers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => mainCommon(AppEnvironment.DEV);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  runApp(
    ProviderScope(
      key: const ValueKey('provider_scope'),
      observers: [Observers()],
      // child: DevicePreview(
      //   key: const ValueKey('device_preview'),
      //   defaultDevice: Devices.ios.iPhone13ProMax,
      //   builder: (context) => const BitaApp(),
      //   enabled: kIsDesktop,
      //   availableLocales: AppLocalizations.supportedLocales,
      // ),
      child: const GcProApp(),
    ),
  );
}
