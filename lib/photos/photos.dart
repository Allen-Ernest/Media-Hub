import 'package:flutter/material.dart';
import 'package:media_hub/photos/image_model.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key, required this.photos});
  final List<ImageModel> photos;

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  Future<void> shareImage(ImageModel image) async {}
  @override
  Widget build(BuildContext context) {
    List<ImageModel> images = widget.photos;
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index){});
  }
}
