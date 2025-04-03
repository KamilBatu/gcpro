import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/tokens/measurements.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DropdownItem {
  DropdownItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
  final String title;
  final String subtitle;
  final String imageUrl;
}

class BottomSheetDropdown extends StatefulWidget {
  // Callback

  const BottomSheetDropdown({
    required this.initialItems,
    super.key,
    this.hintText = "Select an option",
    this.title = "Select an option",
    this.onItemSelected,
    this.defaultItem,
    this.addItemRoute,
  });
  final List<DropdownItem> initialItems;
  final String hintText;
  final String title;
  final ValueChanged<DropdownItem>? onItemSelected;
  final DropdownItem? defaultItem;
  final PageRouteInfo? addItemRoute;

  @override
  BottomSheetDropdownState createState() => BottomSheetDropdownState();
}

class BottomSheetDropdownState extends State<BottomSheetDropdown> {
  List<DropdownItem> items = [];
  DropdownItem? selectedItem;

  @override
  void initState() {
    super.initState();
    items = List.from(widget.initialItems);
    selectedItem = widget.defaultItem;
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: kTopBorderRadius,
      ),
      showDragHandle: true,
      builder: (context) {
        return Padding(
          padding: kPh20v10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    items = widget.initialItems
                        .where(
                          (item) => item.title
                              .toLowerCase()
                              .contains(value.toLowerCase()),
                        )
                        .toList();
                  });
                },
              ),
              const Gap(10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            CachedNetworkImageProvider(items[index].imageUrl),
                      ),
                      title: Text(items[index].title),
                      subtitle: Text(items[index].subtitle),
                      onTap: () {
                        setState(() {
                          selectedItem = items[index];
                        });
                        widget.onItemSelected
                            ?.call(items[index]); // Trigger callback
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text("Add new item"),
                onTap: () async {
                  Navigator.pop(context);

                  final newItem = widget.addItemRoute != null
                      ? await context.router
                          .push<DropdownItem>(widget.addItemRoute!)
                      : await Navigator.of(context).push<DropdownItem>(
                          MaterialPageRoute(
                            builder: (context) => const AddItemPage(),
                          ),
                        );
                  if (newItem != null) {
                    setState(() {
                      items.add(newItem);
                      selectedItem = newItem;
                    });
                    widget.onItemSelected?.call(newItem); // Trigger callback
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.defaultItem == null
          ? _showBottomSheet(context)
          : () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "${widget.defaultItem!.title} selected as default item",
                  ),
                ),
              );
              widget.onItemSelected?.call(widget.defaultItem!);
            }(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.hintText,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
          ),
          const Gap(12),
          InputDecorator(
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderRadius: kBorderRadius25),
              suffixIcon: Icon(Icons.arrow_drop_down),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              children: [
                if (selectedItem != null)
                  CircleAvatar(
                    backgroundImage:
                        CachedNetworkImageProvider(selectedItem!.imageUrl),
                  )
                else
                  const SizedBox(),
                const SizedBox(width: 10),
                Text(
                  selectedItem?.title ?? "",
                  style: TextStyle(
                    color: selectedItem == null
                        ? Colors.grey
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  AddItemPageState createState() => AddItemPageState();
}

class AddItemPageState extends State<AddItemPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  void _saveItem() {
    if (titleController.text.isNotEmpty &&
        subtitleController.text.isNotEmpty &&
        imageUrlController.text.isNotEmpty) {
      final newItem = DropdownItem(
        title: titleController.text,
        subtitle: subtitleController.text,
        imageUrl: imageUrlController.text,
      );
      Navigator.pop(context, newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Item")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: subtitleController,
              decoration: const InputDecoration(labelText: "Subtitle"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: "Image URL"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveItem,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
