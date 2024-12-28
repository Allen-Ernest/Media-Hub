import 'dart:io';

import 'package:flutter/material.dart';

Widget imageContainer({required String imagePath,
  required Function onTap,
  required Function onLongPress,
  required double height,
  required double width}) {
  return GestureDetector(
    onTap: () => onTap,
    onLongPress: () => onLongPress,
    child: Container(
      height: height * 0.05,
      width: width * 0.5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Image(image: FileImage(File(imagePath))),
    ),
  );
}
