import 'package:flutter/material.dart';
import 'package:media_hub/photos/image_model.dart';
import 'package:media_hub/photos/image_container.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key, required this.photos});

  final List<ImageModel> photos;

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  Future<void> shareImage(List<ImageModel> images) async {}

  void editImage(ImageModel image) async {}

  @override
  Widget build(BuildContext context) {
    List<ImageModel> images = widget.photos;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (images.isEmpty) {
      return const Center(
        child: Text('No photos available in storage'),
      );
    } else {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: images.length,
          itemBuilder: (context, index) {
            ImageModel image = images[index];
            return imageContainer(
                imagePath: image.path,
                height: height,
                width: width,
                onTap: () {},
                onLongPress: () {
                  //Highlight image
                });
          });
    }
  }
}

//TODO: Images should be sorted based on dates
//TODO: Add 'open with' feature to allow the app to be among suggestions of opening various media files from storage
