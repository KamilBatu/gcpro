import 'package:gcpro/features/dashboard/presentation/providers/state/account_notifier.dart';
import 'package:gcpro/features/dashboard/presentation/providers/state/account_state.dart';
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
