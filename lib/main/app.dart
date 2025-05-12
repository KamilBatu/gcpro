import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/routes/app_route.dart';
import 'package:gcpro/shared/domain/providers/localization_provider.dart';
import 'package:gcpro/shared/domain/providers/theme_provider.dart';
import 'package:gcpro/shared/utils/om_material_localizations.dart';
import 'package:gcpro/shared/widgets/message_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GcProApp extends ConsumerWidget {
  const GcProApp({super.key});

  static AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp.router(
      title: 'gc project',
      theme: kLightMaterialAppTheme,
      darkTheme: kDarkMaterialAppTheme,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      debugShowCheckedModeBanner: false,
      locale: ref.watch(localizationProvider),
      themeMode: themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        OmMaterialLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      builder: (context, child) {
        return GlobalErrorHandler(child: child!);
      },
    );
  }
}
