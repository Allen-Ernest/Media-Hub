import 'dart:io';

class ImageModel {
  String name;
  int size;
  File file;
  String path;
  DateTime dateCreated;

  ImageModel(
      {required this.name,
      required this.size,
      required this.file,
      required this.path,
      required this.dateCreated});
}
