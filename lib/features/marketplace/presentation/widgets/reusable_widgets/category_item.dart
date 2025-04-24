import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:flutter/material.dart';

// Then create a parent widget to manage the selected state
class CategoryRow extends StatefulWidget {
  const CategoryRow({super.key});

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  int selectedIndex = 0; // Start with first item selected

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryItem(
          label: 'Home',
          isSelected: selectedIndex == 0,
          onTap: () {
            setState(() => selectedIndex = 0);
          },
        ),
        CategoryItem(
          label: 'All Items',
          isSelected: selectedIndex == 1,
          onTap: () => setState(() => selectedIndex = 1),
        ),
        CategoryItem(
          label: 'New Arrivals',
          isSelected: selectedIndex == 2,
          onTap: () => setState(() => selectedIndex = 2),
        ),
        CategoryItem(
          label: 'Sale',
          isSelected: selectedIndex == 3,
          onTap: () => setState(() => selectedIndex = 3),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryItem({
    required this.label,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // Optional: Add a subtle background when selected
          color: isSelected ? kColorWhite : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? kColorSchemeSeed : kColorBlack),
            ),
            if (isSelected) // Add underline only when selected
              Container(
                height: 2,
                width: 20,
                color: kColorSchemeSeed,
                margin: const EdgeInsets.only(top: 2),
              ),
          ],
        ),
      ),
    );
  }
}
