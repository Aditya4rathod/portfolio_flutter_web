import 'package:flutter/foundation.dart';

class MyWorkModel {

  final String label;
  final List<ImageData> images;
  final String? frameWork;


  MyWorkModel({required this.label, required this.images, this.frameWork});
}

class ImageData {
  final String myWorkImg;
  final VoidCallback? onTap;

  ImageData({required this.myWorkImg ,  this.onTap});
}