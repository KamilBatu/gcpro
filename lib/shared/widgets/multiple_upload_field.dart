import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
// import 'package:gcpro/gen/fonts.gen.dart';

// import '../../features/authentication/presentation/providers/registration_provider.dart';

class MultiUploadField extends ConsumerWidget {
  const MultiUploadField({
    required this.lableText,
    super.key,
  });
  final String lableText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final items = ref.watch(multiUploadFieldProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lableText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            // fontFamily: FontFamily.gilroy,
          ),
        ),
        const Gap(8),
        const SizedBox(
          height: 400,
          // child: MasonryGridView.count(
          //   crossAxisCount: 3,
          //   itemCount: items.length + 1, // +1 for the add button
          //   itemBuilder: (BuildContext context, int index) {
          //     if (index == items.length) {
          //       // Add new image button
          //       return GestureDetector(
          //         onTap: () async {
          //           final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

          //           if (pickedFile != null) {
          //             // ref.read(multiUploadFieldProvider.notifier).update((state) {
          //             //   state = [...state, pickedFile];
          //             //   return state;
          //             // });
          //           }
          //         },
          //         child: Container(
          //           height: 80,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8),
          //             border: Border.all(color: Colors.grey),
          //           ),
          //           child: const Center(
          //             child: Icon(Icons.add, size: 40, color: Colors.grey),
          //           ),
          //         ),
          //       );
          //     } else {
          //       // Display uploaded images
          //       return Stack(children: [
          //         // Container(
          //         //   height: 80,
          //         //   decoration: BoxDecoration(
          //         //     borderRadius: BorderRadius.circular(8),
          //         //     border: Border.all(color: Colors.black),
          //         //     image: DecorationImage(
          //         //       image: FileImage(File(items[index].path)),
          //         //       fit: BoxFit.cover,
          //         //     ),
          //         //   ),
          //         //   child: Container(
          //         //     decoration: BoxDecoration(
          //         //       borderRadius: BorderRadius.circular(8),
          //         //       color: Colors.black.withAlpha((0.4 * 255).round()),
          //         //     ),
          //         //   ),
          //         // ),
          //         Positioned(
          //           top: 0,
          //           right: 0,
          //           child: IconButton(
          //             onPressed: () {
          //               // ref.read(multiUploadFieldProvider.notifier).update((state) {
          //               //   state = List.from(state)..removeAt(index);
          //               //   return state;
          //               // });
          //             },
          //             icon: const Icon(
          //               Icons.close,
          //               size: 20,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //       ]);
          //     }
          //   },
          //   mainAxisSpacing: 8.0,
          //   crossAxisSpacing: 8.0,
          // ),
        ),
      ],
    );
  }
}
