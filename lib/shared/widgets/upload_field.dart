import 'dart:io';

import 'package:gcpro/services/token_cache_service/domain/providers/token_cache_provider.dart';
import 'package:gcpro/shared/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class UploadField extends StatefulWidget {
  const UploadField({
    required this.lableText,
    required this.onFileSelected,
    super.key,
    this.extistingFile = "",
  });

  final String extistingFile;
  final String lableText;
  final ValueChanged<File> onFileSelected;

  @override
  State<UploadField> createState() => _UploadFieldState();
}

class _UploadFieldState extends State<UploadField> {
  File? _selectedFile;

  Future<void> _selectFile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
      });

      widget.onFileSelected(_selectedFile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lableText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            // fontFamily: FontFamily.gilroy,
          ),
        ),
        const Gap(8),
        GestureDetector(
          onTap: _selectFile,
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: _selectedFile != null
                  ? Image.file(
                      _selectedFile!,
                      fit: BoxFit.cover,
                    )
                  : Stack(
                      children: [
                        if (widget.extistingFile != "" &&
                            widget.extistingFile.startsWith("/"))
                          Center(
                            child: Consumer(
                              builder: (context, ref, child) => Image(
                                fit: BoxFit.cover,
                                image: CustomNetworkImage(
                                  ref.read(tokenServiceProvider).getAccessToken,
                                  widget.extistingFile,
                                ),
                              ),
                            ),
                          )
                        else
                          const SizedBox.shrink(),
                        // black overlay
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha((0.5 * 255).round()),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),

                        const Center(
                          child: Icon(
                            Icons.add,
                            size: 40,
                            color: Color.fromARGB(255, 199, 199, 199),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
