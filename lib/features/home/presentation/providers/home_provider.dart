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
    return "This Week";
  },
  name: 'salesDurationDistribution',
);

final salesDistribution = AutoDisposeStateProvider<List<double>>(
  (ref) {
    final duration = ref.watch(salesDurationDistribution);
    final Map<String, List<double>> mockData = {
      "This Week": [100, 170, 120, 200, 250, 90, 180],
      "This Month": [200, 250, 150, 300, 200, 250, 150],
      "This Year": [300, 200, 250, 150, 300, 200, 250],
    };
    return mockData[duration]!;
  },
  name: 'salesDistribution',
);

final summaryDurationDistribution = AutoDisposeStateProvider<String>(
  (ref) {
    return "Today";
  },
  name: 'summaryDurationDistribution',
);

final summaryDistribution = AutoDisposeStateProvider<List<Map<String, String>>>(
  (ref) {
    final duration = ref.watch(summaryDurationDistribution);
    final Map<String, List<Map<String, String>>> mockData = {
      "Today": [
        {'value': '43,456.00', 'label': 'Sales'},
        {'value': '10', 'label': 'Low Stock Items'},
        {'value': '5', 'label': 'Items Expiring'},
        {'value': '70', 'label': 'Sales logged'},
      ],
      "This Week": [
        {'value': '58,686.00', 'label': 'Sales'},
        {'value': '20', 'label': 'Low Stock Items'},
        {'value': '10', 'label': 'Items Expiring'},
        {'value': '100', 'label': 'Sales logged'},
      ],
      "This Month": [
        {'value': '100,000.00', 'label': 'Sales'},
        {'value': '50', 'label': 'Low Stock Items'},
        {'value': '20', 'label': 'Items Expiring'},
        {'value': '200', 'label': 'Sales logged'},
      ],
      "This Year": [
        {'value': '1,000,000.00', 'label': 'Sales'},
        {'value': '100', 'label': 'Low Stock Items'},
        {'value': '50', 'label': 'Items Expiring'},
        {'value': '500', 'label': 'Sales logged'},
      ],
    };
    return mockData[duration]!;
  },
  name: 'summaryDistribution',
);
