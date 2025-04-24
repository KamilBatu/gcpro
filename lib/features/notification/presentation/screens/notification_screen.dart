import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const String routeName = 'NotificationScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications".hardcoded),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        toolbarHeight: kToolBarHeight,
        shape: const RoundedRectangleBorder(borderRadius: kBottomBorderRadius),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            NotificationSection(
              title: "New".hardcoded,
              notifications: [
                NotificationItem(
                  leading: const Icon(
                    Icons.inventory_outlined,
                    color: kColorSchemeSeed,
                  ),
                  title: "New Stock",
                  subtitle: "20 items added",
                  actionCallback: () {},
                  actionLable: "",
                ),
                NotificationItem(
                  leading: const Icon(
                    Icons.person_outline,
                    color: kColorSchemeSeed,
                  ),
                  title: "Employee",
                  subtitle: "Added 10 items",
                  actionCallback: () {},
                  actionLable: "view",
                ),
              ],
            ),
            NotificationSection(
              title: "Today".hardcoded,
              notifications: [
                const NotificationItem(
                  leading: Icon(
                    Icons.inventory_outlined,
                    color: kColorSchemeSeed,
                  ),
                  title: "Stock",
                  subtitle: "15 items sold",
                ),
                NotificationItem(
                  leading: const Icon(
                    Icons.inventory_outlined,
                    color: kColorSchemeSeed,
                  ),
                  title: "Stock",
                  subtitle: "10 items added",
                  actionLable: 'View',
                  actionCallback: () {},
                ),
              ],
            ),
            NotificationSection(
              title: "Last 7 days".hardcoded,
              notifications: [
                NotificationItem(
                  leading: const Icon(
                    Icons.inventory_outlined,
                    color: kColorSchemeSeed,
                  ),
                  title: "Stock",
                  subtitle: "5 items sold",
                  actionLable: 'View',
                  actionCallback: () {},
                ),
                NotificationItem(
                  leading: const Icon(
                    Icons.person_outline,
                    color: kColorSchemeSeed,
                  ),
                  title: "Employee",
                  subtitle: "Added 5 items",
                  actionLable: 'View',
                  actionCallback: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationSection extends StatelessWidget {
  const NotificationSection({
    required this.title,
    required this.notifications,
    super.key,
  });
  final String title;
  final List<NotificationItem> notifications;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPv10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: kPh20v15,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(50),
              borderRadius: kBorderRadius10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "see all".hardcoded,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ...notifications,
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    required this.leading,
    required this.title,
    required this.subtitle,
    this.actionLable,
    this.actionCallback,
    super.key,
  });
  final Widget leading;
  final String title;
  final String subtitle;
  final String? actionLable;
  final VoidCallback? actionCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 11, color: Colors.grey),
      ),
      trailing: actionLable == null
          ? null
          : TextButton(
              onPressed: actionCallback,
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: kPh12,
              ),
              child: const Text(
                "view",
                style: TextStyle(fontSize: 12),
              ),
            ),
    );
  }
}
