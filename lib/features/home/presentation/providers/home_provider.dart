import 'package:gcpro/features/home/presentation/providers/state/account_notifier.dart';
import 'package:gcpro/features/home/presentation/providers/state/account_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountListProvider = AutoDisposeStateProvider<List<(String, String)>>(
  (ref) {
    return [
      ('Account1', 'Description1'),
      ('Account2', 'Description2'),
      ('Account3', 'Description3'),
      // Add more accounts as needed
    ];
  },
  name: 'accountListProvider',
);

final accountProvider =
    AutoDisposeStateNotifierProvider<AccountNotifier, AccountState>(
  (ref) {
    return AccountNotifier();
  },
  name: 'accountProvider',
);

final salesDurationDistribution = AutoDisposeStateProvider<String>(
  (ref) {
    return "this_week";
  },
  name: 'salesDurationDistribution',
);

final salesDistribution = AutoDisposeStateProvider<List<double>>(
  (ref) {
    final duration = ref.watch(salesDurationDistribution);
    final Map<String, List<double>> mockData = {
      "this_week": [100, 170, 120, 200, 250, 90, 180],
      "this_month": [200, 250, 150, 300, 200, 250, 150],
      "this_year": [300, 200, 250, 150, 300, 200, 250],
    };
    return mockData[duration]!;
  },
  name: 'salesDistribution',
);

final summaryDurationDistribution = AutoDisposeStateProvider<String>(
  (ref) {
    return "today";
  },
  name: 'summaryDurationDistribution',
);

final summaryDistribution = AutoDisposeStateProvider<List<Map<String, String>>>(
  (ref) {
    final duration = ref.watch(summaryDurationDistribution);
    final Map<String, List<Map<String, String>>> mockData = {
      "today": [
        {'value': '43,456.00', 'label': "sales"},
        {'value': '10', 'label': "low_stock_items"},
        {'value': '5', 'label': "items_expiring"},
        {'value': '70', 'label': "sales_logged"},
      ],
      "this_week": [
        {'value': '58,686.00', 'label': "sales"},
        {'value': '20', 'label': "low_stock_items"},
        {'value': '10', 'label': "items_expiring"},
        {'value': '100', 'label': "sales_logged"},
      ],
      "this_month": [
        {'value': '100,000.00', 'label': "sales"},
        {'value': '50', 'label': "low_stock_items"},
        {'value': '20', 'label': "items_expiring"},
        {'value': '200', 'label': "sales_logged"},
      ],
      "this_year": [
        {'value': '1,000,000.00', 'label': "sales"},
        {'value': '100', 'label': "low_stock_items"},
        {'value': '50', 'label': "items_expiring"},
        {'value': '500', 'label': "sales_logged"},
      ],
    };
    return mockData[duration]!;
  },
  name: 'summaryDistribution',
);
