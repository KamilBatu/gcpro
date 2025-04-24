import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class EditProductScreen extends ConsumerWidget {
  const EditProductScreen({
    @PathParam('productId') required this.productId,
    super.key,
  });

  final String productId;
  static const routeName = '/EditProductScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Fetch product details using productId
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              'Edit Product',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.save_outlined),
                onPressed: () {
                  // TODO: Save product changes
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: kP12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageSection(context),
                  const Gap(24),
                  _buildBasicInfoSection(context),
                  const Gap(24),
                  _buildPricingSection(context),
                  const Gap(24),
                  _buildDescriptionSection(context),
                  const Gap(32),
                  _buildSaveButton(context),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: kBorderRadius25,
            ),
            child: const Icon(
              Icons.image_outlined,
              size: 50,
              color: kColorSchemeSeed,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: kColorSchemeSeed,
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  // TODO: Implement image picker
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfoSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: kP16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Information',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Gap(16),
            CustomTextField(
              controller: TextEditingController(),
              lableText: 'Product Name',
              hintText: 'Enter product name',
            ),
            const Gap(16),
            CustomTextField(
              controller: TextEditingController(),
              lableText: 'Product Code',
              hintText: 'Enter product code',
            ),
            const Gap(16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: TextEditingController(),
                    lableText: 'Category',
                    hintText: 'Select category',
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: CustomTextField(
                    controller: TextEditingController(),
                    lableText: 'Brand',
                    hintText: 'Select brand',
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                  ),
                ),
              ],
            ),
            const Gap(16),
            CustomTextField(
              controller: TextEditingController(),
              lableText: 'Unit',
              hintText: 'Select unit',
              suffixIcon: const Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: kP16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pricing',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Gap(16),
            CustomTextField(
              controller: TextEditingController(),
              lableText: 'Default Price',
              hintText: 'Enter default price',
              prefix: const Text('ETB '),
              number: true,
            ),
            const Gap(16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: TextEditingController(),
                    lableText: 'Cost Price',
                    hintText: 'Enter cost price',
                    prefix: const Text('ETB '),
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: CustomTextField(
                    controller: TextEditingController(),
                    lableText: 'Markup (%)',
                    hintText: 'Enter markup',
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('%'),
                    ),
                    number: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: kP16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Gap(16),
            CustomTextField(
              controller: TextEditingController(),
              lableText: 'Product Description',
              hintText: 'Enter product description',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        icon: const Icon(Icons.save),
        label: const Text('Save Changes'),
        onPressed: () {
          // TODO: Validate and save changes
          Navigator.pop(context);
        },
      ),
    );
  }
}
