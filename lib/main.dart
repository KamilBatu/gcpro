import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gcpro/main/app.dart';
import 'package:gcpro/main/app_env.dart';
import 'package:gcpro/main/observers.dart';

void main() => mainCommon(AppEnvironment.DEV);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);

  runApp(
    ProviderScope(
      key: const ValueKey('provider_scope'),
      observers: [
        Observers(),
      ],
      child: GcPro(),
    ),
  );
}
