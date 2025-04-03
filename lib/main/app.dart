// import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gcpro/l10n/app_localizations.dart';
import 'package:gcpro/routes/app_route.dart';
import 'package:gcpro/shared/domain/providers/localization_provider.dart';
import 'package:gcpro/shared/widgets/message_handler.dart';
import 'package:gcpro_design_system/tokens/themes.dart';

class GcPro extends ConsumerWidget {
  const GcPro({super.key});

  static AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final themeMode = ref.watch(appThemeProvider);
    return MaterialApp.router(
      title: 'GCpro Mobile App',
      theme: kLightMaterialAppTheme,
      darkTheme: kDarkMaterialAppTheme,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      debugShowCheckedModeBanner: false,
      // locale: kDebugMode
      //     ? DevicePreview.locale(context)
      //     : ref.watch(localizationProvider),
      locale: ref.watch(localizationProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        // return DevicePreview.appBuilder(
        //   context,
        //   GlobalErrorHandler(child: child!),
        // );
        return GlobalErrorHandler(child: child!);
      },
    );
  }
}
