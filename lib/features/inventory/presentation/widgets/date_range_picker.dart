import 'package:gcpro/features/inventory/presentation/providers/state/filter_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DateRangePickerWidget extends ConsumerStatefulWidget {
  const DateRangePickerWidget({super.key});

  @override
  DateRangePickerWidgetState createState() => DateRangePickerWidgetState();
}

class DateRangePickerWidgetState extends ConsumerState<DateRangePickerWidget> {
  DateTimeRange? selectedDateRange;

  Future<void> _pickDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDateRange: selectedDateRange,
    );

    ref.read(filterDateRangeStateProvider.notifier).updateFilterDateRange(
          picked ??
              DateTimeRange(
                start: DateTime.fromMicrosecondsSinceEpoch(0),
                end: DateTime.now(),
              ),
        );

    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String dateText = selectedDateRange != null
        ? "${DateFormat('dd/MM/yyyy').format(selectedDateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(selectedDateRange!.end)}"
        : "Select Date Range";

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Date Range Picker
        GestureDetector(
          onTap: () => _pickDateRange(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(26),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  dateText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
