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
          // initial: true,
          children: [
            AutoRoute(page: HomeRoute.page), // Set as initial child
            AutoRoute(page: InventoryRoute.page),
            AutoRoute(
              page: OrdersRoute.page,
              children: [
                AutoRoute(page: SalesOrdersRoute.page),
                AutoRoute(page: PurchaseOrdersRoute.page),
              ],
            ),
            AutoRoute(page: ChatRoute.page),
            AutoRoute(page: MarketPlaceRoute.page),
          ],
        ),
        // ignore: inference_failure_on_instance_creation
        CustomRoute(
          page: ProductDetailRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          duration: Duration(milliseconds: 350),
        ),
        // ignore: inference_failure_on_instance_creation
        CustomRoute(
          page: SellerProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          duration: Duration(milliseconds: 350),
        ),
        // ignore: inference_failure_on_instance_creation
        CustomRoute(
          page: MarketplaceCartRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          duration: Duration(milliseconds: 350),
        ),
        AutoRoute(page: InventoryDetailRoute.page),

        // ignore: inference_failure_on_instance_creation
        CustomRoute(
          page: ProductDetailsRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          duration: Duration(milliseconds: 350),
        ),
        AutoRoute(page: RecieveInventoryRoute.page),
        AutoRoute(page: AddOrderRoute.page),
        // ignore: inference_failure_on_instance_creation
        CustomRoute(
          page: OrderDetailRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          duration: Duration(milliseconds: 350),
        ),
        AutoRoute(page: SettingsRoute.page),
        // ignore: inference_failure_on_instance_creation
        CustomRoute(
          page: RelatedProductPage.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          duration: Duration(milliseconds: 350),
        ),

        AutoRoute(page: EditProductRoute.page),
        // ignore: inference_failure_on_instance_creation
        CustomRoute(
          page: SellerInformation.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          duration: Duration(milliseconds: 350),
        ),
        // AutoRoute(page: NotificationSettingRoute.page),
      ];
}
