import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/shared/const.dart';
import 'package:flutter/material.dart';

// Base Setting Tile
class SettingTile extends StatelessWidget {
  const SettingTile({
    required this.title,
    required this.onTap,
    this.subtitle,
    this.icon,
    this.iconText,
    super.key,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final String? iconText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: kPb10,
      child: ListTile(
        dense: true,
        leading: iconText != null && !kIsWindows
            ? Text(
                iconText!,
                style: const TextStyle(fontSize: 24),
              )
            : Padding(
                padding: kP4,
                child: Icon(icon, color: kColorSchemeSeed),
              ),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
