import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recieve_inventory_state_provider.g.dart';

@riverpod
class RevenuePercentage extends _$RevenuePercentage {
  @override
  double build() => 150;

  void updateRevenuePercentage(double revenuePercentage) =>
      state = revenuePercentage;
}
