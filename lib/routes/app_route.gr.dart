// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i33;

import 'package:auto_route/auto_route.dart' as _i30;
import 'package:flutter/material.dart' as _i31;
import 'package:gcpro/features/auth/presentation/screens/forget_password_screen.dart'
    as _i5;
import 'package:gcpro/features/auth/presentation/screens/login_screen.dart'
    as _i9;
import 'package:gcpro/features/auth/presentation/screens/otp_screen.dart'
    as _i13;
import 'package:gcpro/features/auth/presentation/screens/reset_password_screen.dart'
    as _i22;
import 'package:gcpro/features/auth/presentation/screens/signup_screen.dart'
    as _i27;
import 'package:gcpro/features/chat/presentation/screens/chat_screen.dart'
    as _i2;
import 'package:gcpro/features/chat/presentation/screens/suppliers_screen.dart'
    as _i29;
import 'package:gcpro/features/dashboard/presentation/screens/dashboard_screen.dart'
    as _i3;
import 'package:gcpro/features/home/presentation/screens/home_screen.dart'
    as _i6;
import 'package:gcpro/features/inventory/presentation/screens/edit_product_screen.dart'
    as _i4;
import 'package:gcpro/features/inventory/presentation/screens/inventory_detail_screen.dart'
    as _i7;
import 'package:gcpro/features/inventory/presentation/screens/inventory_screen.dart'
    as _i8;
import 'package:gcpro/features/inventory/presentation/screens/product_details_screen.dart'
    as _i18;
import 'package:gcpro/features/inventory/presentation/screens/recieve_inventory_screen.dart'
    as _i20;
import 'package:gcpro/features/inventory/presentation/widgets/bottomsheet_dropdown.dart'
    as _i34;
import 'package:gcpro/features/marketplace/presentation/screens/marketplace_cart_screen.dart'
    as _i11;
import 'package:gcpro/features/marketplace/presentation/screens/marketplace_screen.dart'
    as _i10;
import 'package:gcpro/features/marketplace/presentation/screens/product_detail_screen.dart'
    as _i17;
import 'package:gcpro/features/marketplace/presentation/screens/related_product_page.dart'
    as _i21;
import 'package:gcpro/features/marketplace/presentation/screens/seller_information.dart'
    as _i24;
import 'package:gcpro/features/marketplace/presentation/screens/seller_profile_screen.dart'
    as _i25;
import 'package:gcpro/features/notification/presentation/screens/notification_screen.dart'
    as _i12;
import 'package:gcpro/features/on_boarding/presentation/screens/on_boarding_screen.dart'
    as _i14;
import 'package:gcpro/features/order/presentation/screens/add_order_screen.dart'
    as _i1;
import 'package:gcpro/features/order/presentation/screens/order_detail_screen.dart'
    as _i15;
import 'package:gcpro/features/order/presentation/screens/orders_screen.dart'
    as _i16;
import 'package:gcpro/features/order/presentation/screens/purchase_orders_screen.dart'
    as _i19;
import 'package:gcpro/features/order/presentation/screens/sales_orders_screen.dart'
    as _i23;
import 'package:gcpro/features/settings/presentation/screens/settings_screen.dart'
    as _i26;
import 'package:gcpro/features/splash/presentation/screens/splash_screen.dart'
    as _i28;
import 'package:gcpro/shared/globals.dart' as _i32;

/// generated route for
/// [_i1.AddOrderScreen]
class AddOrderRoute extends _i30.PageRouteInfo<void> {
  const AddOrderRoute({List<_i30.PageRouteInfo>? children})
    : super(AddOrderRoute.name, initialChildren: children);

  static const String name = 'AddOrderRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddOrderScreen();
    },
  );
}

/// generated route for
/// [_i2.ChatScreen]
class ChatRoute extends _i30.PageRouteInfo<void> {
  const ChatRoute({List<_i30.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChatScreen();
    },
  );
}

/// generated route for
/// [_i3.DashboardScreen]
class DashboardRoute extends _i30.PageRouteInfo<void> {
  const DashboardRoute({List<_i30.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i3.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i4.EditProductScreen]
class EditProductRoute extends _i30.PageRouteInfo<EditProductRouteArgs> {
  EditProductRoute({
    required String productId,
    _i31.Key? key,
    List<_i30.PageRouteInfo>? children,
  }) : super(
         EditProductRoute.name,
         args: EditProductRouteArgs(productId: productId, key: key),
         rawPathParams: {'productId': productId},
         initialChildren: children,
       );

  static const String name = 'EditProductRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EditProductRouteArgs>(
        orElse:
            () => EditProductRouteArgs(
              productId: pathParams.getString('productId'),
            ),
      );
      return _i4.EditProductScreen(productId: args.productId, key: args.key);
    },
  );
}

class EditProductRouteArgs {
  const EditProductRouteArgs({required this.productId, this.key});

  final String productId;

  final _i31.Key? key;

  @override
  String toString() {
    return 'EditProductRouteArgs{productId: $productId, key: $key}';
  }
}

/// generated route for
/// [_i5.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i30.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i30.PageRouteInfo>? children})
    : super(ForgetPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgetPasswordRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i5.ForgetPasswordScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i30.PageRouteInfo<void> {
  const HomeRoute({List<_i30.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeScreen();
    },
  );
}

/// generated route for
/// [_i7.InventoryDetailScreen]
class InventoryDetailRoute extends _i30.PageRouteInfo<void> {
  const InventoryDetailRoute({List<_i30.PageRouteInfo>? children})
    : super(InventoryDetailRoute.name, initialChildren: children);

  static const String name = 'InventoryDetailRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i7.InventoryDetailScreen();
    },
  );
}

/// generated route for
/// [_i8.InventoryScreen]
class InventoryRoute extends _i30.PageRouteInfo<void> {
  const InventoryRoute({List<_i30.PageRouteInfo>? children})
    : super(InventoryRoute.name, initialChildren: children);

  static const String name = 'InventoryRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i8.InventoryScreen();
    },
  );
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i30.PageRouteInfo<void> {
  const LoginRoute({List<_i30.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i9.LoginScreen();
    },
  );
}

/// generated route for
/// [_i10.MarketPlaceScreen]
class MarketPlaceRoute extends _i30.PageRouteInfo<void> {
  const MarketPlaceRoute({List<_i30.PageRouteInfo>? children})
    : super(MarketPlaceRoute.name, initialChildren: children);

  static const String name = 'MarketPlaceRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i10.MarketPlaceScreen();
    },
  );
}

/// generated route for
/// [_i11.MarketplaceCartScreen]
class MarketplaceCartRoute extends _i30.PageRouteInfo<void> {
  const MarketplaceCartRoute({List<_i30.PageRouteInfo>? children})
    : super(MarketplaceCartRoute.name, initialChildren: children);

  static const String name = 'MarketplaceCartRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i11.MarketplaceCartScreen();
    },
  );
}

/// generated route for
/// [_i12.NotificationScreen]
class NotificationRoute extends _i30.PageRouteInfo<void> {
  const NotificationRoute({List<_i30.PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i12.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i13.OTPScreen]
class OTPRoute extends _i30.PageRouteInfo<OTPRouteArgs> {
  OTPRoute({
    required String username,
    required _i32.OTPType otpType,
    required _i33.Future<void> Function() onResendOTP,
    _i31.Key? key,
    List<_i30.PageRouteInfo>? children,
  }) : super(
         OTPRoute.name,
         args: OTPRouteArgs(
           username: username,
           otpType: otpType,
           onResendOTP: onResendOTP,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'OTPRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OTPRouteArgs>();
      return _i13.OTPScreen(
        username: args.username,
        otpType: args.otpType,
        onResendOTP: args.onResendOTP,
        key: args.key,
      );
    },
  );
}

class OTPRouteArgs {
  const OTPRouteArgs({
    required this.username,
    required this.otpType,
    required this.onResendOTP,
    this.key,
  });

  final String username;

  final _i32.OTPType otpType;

  final _i33.Future<void> Function() onResendOTP;

  final _i31.Key? key;

  @override
  String toString() {
    return 'OTPRouteArgs{username: $username, otpType: $otpType, onResendOTP: $onResendOTP, key: $key}';
  }
}

/// generated route for
/// [_i14.OnboardingScreen]
class OnboardingRoute extends _i30.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({_i31.Key? key, List<_i30.PageRouteInfo>? children})
    : super(
        OnboardingRoute.name,
        args: OnboardingRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'OnboardingRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingRouteArgs>(
        orElse: () => const OnboardingRouteArgs(),
      );
      return _i14.OnboardingScreen(key: args.key);
    },
  );
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.OrderDetailScreen]
class OrderDetailRoute extends _i30.PageRouteInfo<OrderDetailRouteArgs> {
  OrderDetailRoute({
    required String orderId,
    String orderType = 'sale',
    _i31.Key? key,
    List<_i30.PageRouteInfo>? children,
  }) : super(
         OrderDetailRoute.name,
         args: OrderDetailRouteArgs(
           orderId: orderId,
           orderType: orderType,
           key: key,
         ),
         rawPathParams: {'orderId': orderId},
         rawQueryParams: {'type': orderType},
         initialChildren: children,
       );

  static const String name = 'OrderDetailRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<OrderDetailRouteArgs>(
        orElse:
            () => OrderDetailRouteArgs(
              orderId: pathParams.getString('orderId'),
              orderType: queryParams.getString('type', 'sale'),
            ),
      );
      return _i15.OrderDetailScreen(
        orderId: args.orderId,
        orderType: args.orderType,
        key: args.key,
      );
    },
  );
}

class OrderDetailRouteArgs {
  const OrderDetailRouteArgs({
    required this.orderId,
    this.orderType = 'sale',
    this.key,
  });

  final String orderId;

  final String orderType;

  final _i31.Key? key;

  @override
  String toString() {
    return 'OrderDetailRouteArgs{orderId: $orderId, orderType: $orderType, key: $key}';
  }
}

/// generated route for
/// [_i16.OrdersScreen]
class OrdersRoute extends _i30.PageRouteInfo<void> {
  const OrdersRoute({List<_i30.PageRouteInfo>? children})
    : super(OrdersRoute.name, initialChildren: children);

  static const String name = 'OrdersRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i16.OrdersScreen();
    },
  );
}

/// generated route for
/// [_i17.ProductDetailScreen]
class ProductDetailRoute extends _i30.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({required int id, List<_i30.PageRouteInfo>? children})
    : super(
        ProductDetailRoute.name,
        args: ProductDetailRouteArgs(id: id),
        initialChildren: children,
      );

  static const String name = 'ProductDetailRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailRouteArgs>();
      return _i17.ProductDetailScreen(args.id);
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({required this.id});

  final int id;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{id: $id}';
  }
}

/// generated route for
/// [_i18.ProductDetailsScreen]
class ProductDetailsRoute extends _i30.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    required _i18.Product product,
    _i31.Key? key,
    List<_i30.PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(product: product, key: key),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i18.ProductDetailsScreen(product: args.product, key: args.key);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({required this.product, this.key});

  final _i18.Product product;

  final _i31.Key? key;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{product: $product, key: $key}';
  }
}

/// generated route for
/// [_i19.PurchaseOrdersScreen]
class PurchaseOrdersRoute extends _i30.PageRouteInfo<void> {
  const PurchaseOrdersRoute({List<_i30.PageRouteInfo>? children})
    : super(PurchaseOrdersRoute.name, initialChildren: children);

  static const String name = 'PurchaseOrdersRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i19.PurchaseOrdersScreen();
    },
  );
}

/// generated route for
/// [_i20.RecieveInventoryScreen]
class RecieveInventoryRoute
    extends _i30.PageRouteInfo<RecieveInventoryRouteArgs> {
  RecieveInventoryRoute({
    _i31.Key? key,
    _i34.DropdownItem? defaultProduct,
    List<_i30.PageRouteInfo>? children,
  }) : super(
         RecieveInventoryRoute.name,
         args: RecieveInventoryRouteArgs(
           key: key,
           defaultProduct: defaultProduct,
         ),
         initialChildren: children,
       );

  static const String name = 'RecieveInventoryRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecieveInventoryRouteArgs>(
        orElse: () => const RecieveInventoryRouteArgs(),
      );
      return _i20.RecieveInventoryScreen(
        key: args.key,
        defaultProduct: args.defaultProduct,
      );
    },
  );
}

class RecieveInventoryRouteArgs {
  const RecieveInventoryRouteArgs({this.key, this.defaultProduct});

  final _i31.Key? key;

  final _i34.DropdownItem? defaultProduct;

  @override
  String toString() {
    return 'RecieveInventoryRouteArgs{key: $key, defaultProduct: $defaultProduct}';
  }
}

/// generated route for
/// [_i21.RelatedProductPage]
class RelatedProductPage extends _i30.PageRouteInfo<RelatedProductPageArgs> {
  RelatedProductPage({
    _i31.Key? key,
    required int id,
    List<_i30.PageRouteInfo>? children,
  }) : super(
         RelatedProductPage.name,
         args: RelatedProductPageArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'RelatedProductPage';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RelatedProductPageArgs>();
      return _i21.RelatedProductPage(key: args.key, id: args.id);
    },
  );
}

class RelatedProductPageArgs {
  const RelatedProductPageArgs({this.key, required this.id});

  final _i31.Key? key;

  final int id;

  @override
  String toString() {
    return 'RelatedProductPageArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i22.ResetPasswordScreen]
class ResetPasswordRoute extends _i30.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i30.PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i22.ResetPasswordScreen();
    },
  );
}

/// generated route for
/// [_i23.SalesOrdersScreen]
class SalesOrdersRoute extends _i30.PageRouteInfo<void> {
  const SalesOrdersRoute({List<_i30.PageRouteInfo>? children})
    : super(SalesOrdersRoute.name, initialChildren: children);

  static const String name = 'SalesOrdersRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i23.SalesOrdersScreen();
    },
  );
}

/// generated route for
/// [_i24.SellerInformation]
class SellerInformation extends _i30.PageRouteInfo<void> {
  const SellerInformation({List<_i30.PageRouteInfo>? children})
    : super(SellerInformation.name, initialChildren: children);

  static const String name = 'SellerInformation';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i24.SellerInformation();
    },
  );
}

/// generated route for
/// [_i25.SellerProfileScreen]
class SellerProfileRoute extends _i30.PageRouteInfo<void> {
  const SellerProfileRoute({List<_i30.PageRouteInfo>? children})
    : super(SellerProfileRoute.name, initialChildren: children);

  static const String name = 'SellerProfileRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i25.SellerProfileScreen();
    },
  );
}

/// generated route for
/// [_i26.SettingsScreen]
class SettingsRoute extends _i30.PageRouteInfo<void> {
  const SettingsRoute({List<_i30.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i26.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i27.SignupScreen]
class SignupRoute extends _i30.PageRouteInfo<void> {
  const SignupRoute({List<_i30.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i27.SignupScreen();
    },
  );
}

/// generated route for
/// [_i28.SplashScreen]
class SplashRoute extends _i30.PageRouteInfo<void> {
  const SplashRoute({List<_i30.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i28.SplashScreen();
    },
  );
}

/// generated route for
/// [_i29.SuppliersScreen]
class SuppliersRoute extends _i30.PageRouteInfo<void> {
  const SuppliersRoute({List<_i30.PageRouteInfo>? children})
    : super(SuppliersRoute.name, initialChildren: children);

  static const String name = 'SuppliersRoute';

  static _i30.PageInfo page = _i30.PageInfo(
    name,
    builder: (data) {
      return const _i29.SuppliersScreen();
    },
  );
}
