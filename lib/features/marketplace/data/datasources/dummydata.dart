import 'package:gcpro/features/marketplace/data/models/product_model.dart';

final List<ProductModel> products = [
  ProductModel(
    id: 1,
    name: "PainRelief Plus",
    price: 12.99,
    description: "Fast-acting pain reliever for headaches and muscle pain",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2021/03/27/05/10/pills-6127501_1280.jpg",
  ),
  ProductModel(
    id: 2,
    name: "VitaBoost Multivitamin",
    price: 24.99,
    description: "Daily multivitamin with essential nutrients",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2018/12/21/08/06/about-3887439_1280.jpg",
  ),
  ProductModel(
    id: 3,
    name: "CoughCure Syrup",
    price: 8.99,
    description: "Soothing syrup for dry and wet coughs",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2023/03/13/10/25/pills-7849503_1280.jpg",
  ),
  ProductModel(
    id: 4,
    name: "AllergyShield",
    price: 15.99,
    description: "24-hour allergy relief tablets",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2016/12/05/19/49/syringe-1884784_1280.jpg",
  ),
  ProductModel(
    id: 5,
    name: "SleepWell Capsules",
    price: 19.99,
    description: "Natural sleep aid for better rest",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2023/12/11/11/32/ai-generated-8443395_1280.jpg",
  ),
  ProductModel(
    id: 6,
    name: "ColdGuard",
    price: 9.99,
    description: "Immune support for cold prevention",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2020/12/03/06/41/pills-5799622_1280.jpg",
  ),
  ProductModel(
    id: 1,
    name: "PainRelief Plus",
    price: 12.99,
    description: "Fast-acting pain reliever for headaches and muscle pain",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2021/03/27/05/10/pills-6127501_1280.jpg",
  ),
  ProductModel(
    id: 2,
    name: "VitaBoost Multivitamin",
    price: 24.99,
    description: "Daily multivitamin with essential nutrients",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2018/12/21/08/06/about-3887439_1280.jpg",
  ),
  ProductModel(
    id: 3,
    name: "CoughCure Syrup",
    price: 8.99,
    description: "Soothing syrup for dry and wet coughs",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2023/03/13/10/25/pills-7849503_1280.jpg",
  ),
  ProductModel(
    id: 4,
    name: "AllergyShield",
    price: 15.99,
    description: "24-hour allergy relief tablets",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2016/12/05/19/49/syringe-1884784_1280.jpg",
  ),
  ProductModel(
    id: 5,
    name: "SleepWell Capsules",
    price: 19.99,
    description: "Natural sleep aid for better rest",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2023/12/11/11/32/ai-generated-8443395_1280.jpg",
  ),
  ProductModel(
    id: 6,
    name: "ColdGuard",
    price: 9.99,
    description: "Immune support for cold prevention",
    rating: 4.3,
    imageUrl:
        "https://cdn.pixabay.com/photo/2020/12/03/06/41/pills-5799622_1280.jpg",
  ),

  // Add more unique entries if needed
];

// class ProductLocalDataSource {
//   Future<List<ProductModel>> getProducts() async {
//     await Future.delayed(const Duration(milliseconds: 500)); // Simulate delay
//     return List.unmodifiable(products);
//   }

//   Future<ProductModel> getProductById(int id) async {
//     await Future.delayed(const Duration(milliseconds: 500));
//     return products.firstWhere((product) => product.id == id);
//   }
// }
