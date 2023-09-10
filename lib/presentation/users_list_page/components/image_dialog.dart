import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
