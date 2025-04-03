import 'package:gcpro/features/inventory/presentation/screens/product_details_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_list_provider.g.dart';

@riverpod
class ProductList extends _$ProductList {
  @override
  Future<List<Product>> build(String query) async {
    return [
      const Product(
        productName: "Aspirin 500mg",
        productCode: "ASP-500",
        category: "Medicine",
        brand: "Bayer",
        description:
            "Aspirin is used to reduce fever and relieve mild to moderate pain.",
        unit: "Box of 100 tablets",
        defaultPrice: 12.50,
        imageUrl: "https://fakeimg.pl/600x400",
      ),
      const Product(
        productName: "Aspirin 500mg",
        productCode: "ASP-500",
        category: "Medicine",
        brand: "Bayer",
        description:
            "Aspirin is used to reduce fever and relieve mild to moderate pain.",
        unit: "Box of 100 tablets",
        defaultPrice: 12.50,
        imageUrl: "https://fakeimg.pl/600x400",
      ),
    ]
        .where((product) => product.toString().contains(query.toLowerCase()))
        .toList();
  }
}
