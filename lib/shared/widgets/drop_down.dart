import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/shared/mixins/localization_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    required this.options,
    required this.onChanged,
    required this.defaultOption,
    super.key,
    this.backgroundColor = kColorSchemeSeed,
    this.minWidth = 150,
  });
  final List<String> options;
  final String defaultOption;
  final ValueChanged<String> onChanged;
  final Color backgroundColor;
  final double minWidth;

  @override
  CustomDropDownState createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDown> {
  late String _selectedItem;
  bool _isTapped = false;

  @override
  void initState() {
    super.initState();
    if (!widget.options.contains(widget.defaultOption)) {
      throw Exception('Default option cannot be empty');
    }
    _selectedItem = widget.defaultOption;
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      constraints: const BoxConstraints(maxHeight: 500),
      builder: (context) {
        return Container(
          margin: const EdgeInsets.only(top: 20, bottom: 15),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: List.generate(
              widget.options.length,
              (index) {
                return ListTile(
                  dense: true,
                  selectedTileColor:
                      widget.backgroundColor.withValues(alpha: 0.15),
                  selected: _selectedItem == widget.options[index],
                  visualDensity: const VisualDensity(
                    vertical: VisualDensity.minimumDensity,
                    horizontal: VisualDensity.minimumDensity,
                  ),
                  trailing: _selectedItem == widget.options[index]
                      ? const Icon(
                          Icons.check_circle_outline_rounded,
                          size: 18,
                          color: kColorSchemeSeed,
                        )
                      : null,
                  title: Text(
                    AppLocalizations.of(context)
                            .getRange(widget.options[index]) ??
                        widget.options[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: _selectedItem == widget.options[index]
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    setState(
                      () {
                        _selectedItem = widget.options[index];
                        _isTapped = false;
                      },
                    );
                    widget.onChanged(_selectedItem);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    ).then((value) {
      setState(() {
        _isTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const languageMap = {
      'en': 'English',
      'om': 'Oromo',
      'am': 'Amharic',
    };

    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = true;
        });
        _showBottomSheet(context);
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: widget.minWidth),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: _isTapped
                ? widget.backgroundColor.withValues(
                    alpha: 0.15,
                  )
                : widget.backgroundColor.withValues(
                    alpha: 0.15,
                  ),
            border: Border.all(
              color: _isTapped ? widget.backgroundColor : Colors.transparent,
              width: 2,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).getFiltterLable(_selectedItem) ??
                    widget.defaultOption,
                style: TextStyle(
                  color: _isTapped
                      ? widget.backgroundColor
                      : Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const Gap(5),
              Icon(
                Icons.arrow_drop_down,
                size: 17,
                color: _isTapped
                    ? widget.backgroundColor
                    : Theme.of(context).colorScheme.onSurface.withAlpha(
                          (255 * 0.5).toInt(),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
