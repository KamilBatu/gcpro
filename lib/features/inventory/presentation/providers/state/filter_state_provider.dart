import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_state_provider.g.dart';

enum FilterStatus {
  all,
  added,
  out,
}

@riverpod
class FilterStatusState extends _$FilterStatusState {
  @override
  FilterStatus build() => FilterStatus.all;

  void updateFilterState(FilterStatus filterState) => state = filterState;
}

@riverpod
class FilterDateRangeState extends _$FilterDateRangeState {
  @override
  DateTimeRange build() => DateTimeRange(
        start: DateTime.fromMicrosecondsSinceEpoch(0),
        end: DateTime.now(),
      );

  void updateFilterDateRange(DateTimeRange dateRange) => state = dateRange;
}
