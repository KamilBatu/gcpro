import 'package:auto_route/auto_route.dart';
import 'package:gcpro/routes/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Tab|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ForgetPasswordRoute.page),
        AutoRoute(page: OTPRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),

        // Make DashboardRoute initial
        AutoRoute(
          page: DashboardRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page), // Set as initial child
            AutoRoute(page: InventoryRoute.page),
            AutoRoute(page: OrdersRoute.page),
            AutoRoute(page: ChatRoute.page),
            AutoRoute(page: MarketPlaceRoute.page),
          ],
        ),
        AutoRoute(page: ProductDetailRoute.page),
        AutoRoute(page: SellerProfileRoute.page),
        AutoRoute(page: MarketplaceCartRoute.page),
        AutoRoute(page: InventoryDetailRoute.page),
        AutoRoute(page: ProductDetailsRoute.page),
        AutoRoute(page: RecieveInventoryRoute.page),
      ];
}

// import 'package:auto_route/auto_route.dart';
// import 'package:gcpro/routes/app_route.gr.dart';

// // part 'app_route.gr.dart';

// @AutoRouterConfig(replaceInRouteName: 'Tab|Screen,Route')
// class AppRouter extends RootStackRouter {
//   @override
//   RouteType get defaultRouteType => const RouteType.material();

//   @override
//   List<AutoRoute> get routes => [
//         AutoRoute(page: SplashRoute.page, initial: true),
//         AutoRoute(page: OnboardingRoute.page),
//         AutoRoute(page: SignupRoute.page),
//         AutoRoute(page: LoginRoute.page),
//         AutoRoute(page: ForgetPasswordRoute.page),
//         AutoRoute(page: OTPRoute.page),
//         AutoRoute(page: ResetPasswordRoute.page),
//         // AutoRoute(page: AccountTypeRoute.page),

//         // // Dashboard Page
//         AutoRoute(
//           page: DashboardRoute.page,
//           children: [
//             AutoRoute(page: HomeRoute.page),
//             AutoRoute(page: InventoryRoute.page),
//             AutoRoute(page: OrdersRoute.page),
//             AutoRoute(page: ChatRoute.page),
//             AutoRoute(page: MarketPlaceRoute.page),
//           ],
//         ),
//       ];
// }
