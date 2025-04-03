import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

void goTo(PageRouteInfo<dynamic> route, BuildContext context) =>
    AutoRouter.of(context).pushAndPopUntil(route, predicate: (_) => false);
