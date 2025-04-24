import 'package:gcpro/gen/l10n.dart';

extension AppLocalizationsHelper on AppLocalizations {
  String? getRange(String key) {
    final map = {
      'this_week': this_week,
      'this_month': this_month,
      'this_year': this_year,
      'today': today,
    };

    return map[key];
  }

  String? getSummaryLable(String key) {
    final map = {
      "sales": sales,
      "low_stock_items": low_stock_items,
      "items_expiring": items_expiring,
      "sales_logged": sales_logged,
    };

    return map[key];
  }

  String? getFiltterLable(String key) {
    final map = {
      "all": all,
      "added": added,
      "out": out,
    };

    return map[key];
  }
}
