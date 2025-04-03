import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/tokens/tokens.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/quantity_selecter.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/action_state_provider.dart';

class CartCheckboxWidget extends ConsumerWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double price;

  const CartCheckboxWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkboxStateProvider = StateProvider<bool>((ref) => false);

    return Container(
      decoration: BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.circular(1),
        boxShadow: const [
          BoxShadow(
            color: kColorBlack25,
            spreadRadius: 4,
            blurRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: CheckboxTheme(
        data: const CheckboxThemeData(
          shape: CircleBorder(),
          checkColor: WidgetStatePropertyAll(kColorBlack25),
        ),
        child: CheckboxListTile(
          value: ref.watch(checkboxStateProvider),
          onChanged: (bool? value) {
            ref.read(checkboxStateProvider.notifier).state = value ?? false;
          },
          shape: const CircleBorder(),
          side: const BorderSide(
            color: kColorBlack50,
            width: 1.0,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 7.0),
          controlAffinity: ListTileControlAffinity.leading,
          title: _buildContent(context, ref),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildImageSection(context),
        const SizedBox(width: 10.0),
        Expanded(child: _buildDetailsSection(context, ref)),
      ],
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => context.router.push(ProductDetailRoute(id: '1')),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: MediaQuery.sizeOf(context).width * 0.25,
              height: MediaQuery.sizeOf(context).height * 0.13,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  child: Icon(Icons.error),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: kColorBlack50,
            width: MediaQuery.sizeOf(context).width * 0.25,
            height: MediaQuery.sizeOf(context).height * 0.13 / 4,
            child: Center(
              child: Text(
                'khb-Shoi',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: kColorWhite),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsSection(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.47,
      height: MediaQuery.sizeOf(context).height * 0.17,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleSubtitle(context),
          _buildViewProfile(context, ref),
          _buildPriceQuantity(context, ref),
        ],
      ),
    );
  }

  Widget _buildTitleSubtitle(BuildContext context) {
    return Expanded(
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 10),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  Widget _buildViewProfile(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 8),
        title: GestureDetector(
          onTap: () => context.router.push(SellerProfileRoute()),
          child: Text(
            'view-shop >',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: kColorSchemeSeed),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceQuantity(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.only(bottom: 1),
      leading: Text(
        'ETB$price',
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: QuantitySelector(
        width: MediaQuery.sizeOf(context).width * 0.2,
        height: MediaQuery.sizeOf(context).height * 0.035,
        ref: ref,
        onAdd: () => addQuantity(ref),
        onRemove: () => removeQuantity(ref),
        controller: ref.watch(textControllerProvider),
        numberProvider: numberProvider,
      ),
    );
  }
}
