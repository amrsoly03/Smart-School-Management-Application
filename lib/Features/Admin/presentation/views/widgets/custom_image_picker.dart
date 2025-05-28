import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key, required this.onPickedImage});

  final Function(File pickedImage) onPickedImage;

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    final XFile? pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    widget.onPickedImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_pickedImageFile != null)
          imageContainer(Image.file(
            _pickedImageFile!,
            fit: BoxFit.cover,
          )),
        if (_pickedImageFile == null)
          imageContainer(
            const SizedBox(),
          ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(
            Icons.image,
            color: darkBlue,
          ),
          label:  Text(
            'Add Image',
            style: Styles.textStyle16.copyWith(
              color: darkBlue,
            ),
          ),
        )
      ],
    );
  }
}

@override
Widget imageContainer(Widget? widget) {
  return Container(
    height: 150,
    width: 150,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 194, 194, 194),
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        width: 2,
        color: darkBlue,
        style: BorderStyle.solid,
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: widget,
    ),
  );
}
