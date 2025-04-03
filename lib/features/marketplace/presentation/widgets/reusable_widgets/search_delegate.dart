import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SimpleSearchDelegate extends SearchDelegate {
  final AsyncValue<List<dynamic>> Function(WidgetRef) dataProvider;
  final String Function(dynamic) getSearchText;
  final Widget Function(dynamic) buildResultItem;

  SimpleSearchDelegate({
    required this.dataProvider,
    required this.getSearchText,
    required this.buildResultItem,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  List<dynamic> _filterItems(List<dynamic> items) {
    return items
        .where((item) =>
            getSearchText(item).toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final dataList = dataProvider(ref);
        return dataList.when(
          data: (items) {
            final filteredItems = _filterItems(items);
            if (filteredItems.isEmpty) {
              return const Center(child: Text('No results found'));
            }
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              padding: const EdgeInsets.all(20),
              children:
                  filteredItems.map((item) => buildResultItem(item)).toList(),
            );
          },
          error: (error, stack) => Center(child: Text('Error: $error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final dataList = dataProvider(ref);
        return dataList.when(
          data: (items) {
            final filteredItems = _filterItems(items);
            if (filteredItems.isEmpty) {
              return const Center(child: Text('No suggestions'));
            }
            return ListView(
              children: filteredItems
                  .map((item) => ListTile(
                        leading: const Icon(Icons.search),
                        title: Text(getSearchText(item)),
                        onTap: () {
                          query = getSearchText(item);
                          showResults(context);
                        },
                      ))
                  .toList(),
            );
          },
          error: (error, stack) => Center(child: Text('Error: $error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
