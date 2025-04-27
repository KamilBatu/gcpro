import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_cart_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/badge_cart_icon.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/show_bottom_sheet_action.dart';
import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:gcpro/features/marketplace/presentation/providers/marketplace_product_provider.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/actionbutton_iconsbutton.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/animated_border.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RelatedProductPage extends ConsumerWidget {
  final int id;
  const RelatedProductPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(allProductsProvider);
    final marketCartProvider = ref.watch(marketPlaceCartProvider);

    return Scaffold(
      backgroundColor: kColorWhite50,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            icon: buildCircleAvatar(
                icon: Icons.keyboard_arrow_left,
                backgroundColor: kColorBlack50,
                iconColor: kColorWhite),
            onPressed: () {
              context.router.pop();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: buildCircleAvatar(
              icon: Icons.search,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: buildCircleAvatar(icon: Icons.more_horiz),
            onPressed: () {},
          ),
          BadgeCartIcon(
            cartCount: marketCartProvider.items.length,
            iconColor: kColorSchemeSeed,
            iconSize: 24,
            badgeSize: 18,
            onPressed: () {
              context.router.push(MarketplaceCartRoute());
            },
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.transparent,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: allProducts.when(
        data: (products) =>
            BuildRelatedProduct(products: products, targetId: id),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorWidgetWithRetry(error: error, ref: ref),
      ),
    );
  }
}

class BuildRelatedProduct extends ConsumerWidget {
  const BuildRelatedProduct(
      {super.key, required this.products, required this.targetId});
  final int targetId;
  final List<Product> products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetProduct = products.firstWhere(
      (product) => product.id == targetId,
    );

    final relatedProducts = products.where((product) {
      return product.name
          .toLowerCase()
          .contains(targetProduct.name.toLowerCase());
    }).toList();

    if (relatedProducts.isEmpty) {
      return const Center(child: Text('No related products found.'));
    }
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: relatedProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: buildContainerDecoration(),
          margin: EdgeInsets.symmetric(vertical: 4),
          height: MediaQuery.sizeOf(context).height * 0.65,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              Column(children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.45,
                      child: GestureDetector(
                        onTap: () {
                          print(
                              'detected on image : ${relatedProducts[index].id}');
                          context.router.push(ProductDetailRoute(
                              id: relatedProducts[index].id));
                        },
                        child: Image.asset(
                          relatedProducts[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 50,
                      top: 50,
                      bottom: 50,
                      left: 50,
                      child: IconButton(
                        onPressed: () {
                          print('detected icon : ${relatedProducts[index].id}');
                          context.router.push(ProductDetailRoute(
                              id: relatedProducts[index].id));
                        },
                        icon: buildCircleAvatar(
                            backgroundColor: kColorWhite50,
                            iconColor: kColorBlack,
                            icon: Icons.keyboard_arrow_right),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration:
                      buildContainerDecoration(blurRadius: 20, spreadRadius: 5),
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  width: MediaQuery.sizeOf(context).width * 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, top: 8),
                        height: 28,
                        child: Text(
                          products[index].description,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  relatedProducts[index].name,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  '${relatedProducts[index].price}ETB',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'location: bole,Adama',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: kColorSchemeSeed),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildActionButton(
                            label: 'Chat Now',
                            isOutlined: true,
                            onPressed: () {
                              context.router.navigate(const ChatRoute());
                            },
                            context: context,
                            textColor: kColorSchemeSeed,
                          ),
                          buildActionButton(
                            label: 'Add to cart',
                            isOutlined: true,
                            onPressed: () {
                              showBottomSheets(
                                context: context,
                                product: products[index],
                                isBuyNow: false,
                              );
                            },
                            context: context,
                            textColor: kColorSchemeSeed,
                          ),
                          buildActionButton(
                            label: 'Start order',
                            onPressed: () {},
                            context: context,
                            textColor: kColorWhite,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
              Positioned(
                bottom: 140,
                right: 30,
                child: GestureDetector(
                  onTap: () => context.router.push(const SellerProfileRoute()),
                  child: const AnimatedAvatarBorder(
                    drawArc: 6.23,
                    radius: 24,
                    borderWidth: 2,
                    borderColor: kColorWhite,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: kColorBlack50,
                      child: Icon(Icons.abc, size: 36, color: kColorWhite),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
