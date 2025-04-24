import 'dart:core';
import 'package:gcpro/features/marketplace/data/datasources/dummydata.dart';
import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

class CategoriesNotifier extends StateNotifier<List<Category>> {
  CategoriesNotifier() : super([]) {
    // Initialize _selectedCategoryId to -1
    _selectedCategoryId = -1;
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final mockCategories = categories;
    state = mockCategories;
  }

  Future<void> refreshCategories(WidgetRef ref) async {
    // Reset _selectedCategoryId to -1 on refresh
    _selectedCategoryId = -1;
    // Update the product list to show all products (no category filter)
    ref.read(ListOfselectedCategoryProvider.notifier).state = productsMockData
        .map((productModel) => productModel.toEntity())
        .toList();
    // Fetch categories again
    await fetchCategories();
  }

  int? get selectedCategoryId => _selectedCategoryId;
  int? _selectedCategoryId;

  void selectCategory2(int? categoryId, WidgetRef ref) {
    _selectedCategoryId = categoryId;
    state = [...state];
    ref.read(ListOfselectedCategoryProvider.notifier).state = categoryId == null
        ? productsMockData
            .map((productModel) => productModel.toEntity())
            .toList()
        : productsMockData
            .where((element) => element.category.id == categoryId)
            .map((productModel) => productModel.toEntity())
            .toList();
  }

  void selectCategory(Category? category, WidgetRef ref) {
    if (category == null) {
      _selectedCategoryId = -1;
      ref.read(ListOfselectedCategoryProvider.notifier).state = productsMockData
          .map((productModel) => productModel.toEntity())
          .toList();
    } else {
      _selectedCategoryId = category.id;
      ref.read(ListOfselectedCategoryProvider.notifier).state = productsMockData
          .where((element) => element.category.id == category.id)
          .map((productModel) => productModel.toEntity())
          .toList();
    }
  }
}

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, List<Category>>(
  (ref) => CategoriesNotifier(),
);

final ListOfselectedCategoryProvider = StateProvider<List<Product>>(
  (ref) =>
      productsMockData.map((productModel) => productModel.toEntity()).toList(),
);
