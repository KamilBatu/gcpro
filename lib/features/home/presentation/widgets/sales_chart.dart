import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/home/presentation/providers/home_provider.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/shared/widgets/drop_down.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SalesChartCard extends ConsumerWidget {
  const SalesChartCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesDistributionDuration = ref.watch(salesDurationDistribution);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).sale_distribution,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomDropDown(
                defaultOption: salesDistributionDuration,
                options: const [
                  "this_week",
                  "this_month",
                  "this_year",
                ],
                onChanged: (value) {
                  ref
                      .read(salesDurationDistribution.notifier)
                      .update((state) => value);
                },
                minWidth: 80,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Bar Chart
          AspectRatio(
            aspectRatio: 1.8,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    // tooltipBgColor: Colors.grey,
                    getTooltipColor: (group) => kColorSchemeSeed,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        rod.toY.round().toString(),
                        const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final List<String> days = [
                          AppLocalizations.of(context).mon,
                          AppLocalizations.of(context).tue,
                          AppLocalizations.of(context).wed,
                          AppLocalizations.of(context).thu,
                          AppLocalizations.of(context).fri,
                          AppLocalizations.of(context).sat,
                          AppLocalizations.of(context).sun,
                        ];
                        return Text(
                          days[value.toInt()],
                          style: const TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                ),
                barGroups: _generateBars(ref.watch(salesDistribution)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Generate Bar Groups
  List<BarChartGroupData> _generateBars(List<double> sales) {
    return List.generate(sales.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: sales[index],
            color: kColorSchemeSeed,
            width: 16,
            borderRadius: BorderRadius.circular(8),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 300,
              color: kColorSchemeSeed.withAlpha(50),
            ),
          ),
        ],
      );
    });
  }
}
