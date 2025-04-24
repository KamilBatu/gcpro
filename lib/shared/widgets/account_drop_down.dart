import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class AccountSelectionDropdown extends StatefulWidget {
  const AccountSelectionDropdown({
    required this.accounts,
    required this.onChanged,
    required this.defaultAccount,
    super.key,
    this.backgroundColor = kColorSchemeSeed,
    this.minWidth = 120,
  });
  final List<(String, String)> accounts;
  final (String, String) defaultAccount;
  final ValueChanged<(String, String)> onChanged;
  final Color backgroundColor;
  final double minWidth;

  @override
  AccountSelectionDropdownState createState() =>
      AccountSelectionDropdownState();
}

class AccountSelectionDropdownState extends State<AccountSelectionDropdown> {
  late (String, String) _selectedItem;
  bool _isTapped = false;

  @override
  void initState() {
    super.initState();
    // if (!widget.accounts.contains(widget.defaultAccount)) {
    //   throw Exception('Default option cannot be empty');
    // }
    _selectedItem = widget.defaultAccount;
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
              widget.accounts.length,
              (index) {
                return ListTile(
                  dense: true,
                  selectedTileColor: widget.backgroundColor.withValues(
                    alpha: 0.15,
                  ),
                  selected: _selectedItem == widget.accounts[index],
                  visualDensity: const VisualDensity(
                    vertical: VisualDensity.minimumDensity,
                    horizontal: VisualDensity.minimumDensity,
                  ),
                  trailing: _selectedItem == widget.accounts[index]
                      ? const Icon(
                          Icons.check_circle_outline_rounded,
                          size: 18,
                          color: kColorSchemeSeed,
                        )
                      : null,
                  title: Text(
                    widget.accounts[index].$1,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: _selectedItem == widget.accounts[index]
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  subtitle: Text(
                    widget.accounts[index].$2,
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  onTap: () {
                    setState(
                      () {
                        _selectedItem = widget.accounts[index];
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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: !widget.accounts.contains(widget.defaultAccount)
          ? Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.surface.withAlpha(50),
              highlightColor:
                  Theme.of(context).colorScheme.surface.withAlpha(25),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: widget.minWidth),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 10,
                            color: Colors.white,
                          ),
                          Container(
                            width: 80,
                            height: 10,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const Gap(5),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 17,
                        color: Colors.grey[400],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : GestureDetector(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: _isTapped
                        ? widget.backgroundColor.withValues(
                            alpha: 0.15,
                          )
                        : widget.backgroundColor.withValues(
                            alpha: 0.15,
                          ),
                    border: Border.all(
                      color: _isTapped
                          ? widget.backgroundColor
                          : Colors.transparent,
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedItem.$1,
                            style: TextStyle(
                              color: _isTapped
                                  ? widget.backgroundColor
                                  : Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            _selectedItem.$2,
                            style: TextStyle(
                              color: _isTapped
                                  ? widget.backgroundColor
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                              fontSize: 10,
                            ),
                          ),
                        ],
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
            ),
    );
  }
}
