import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/assets_images.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({Key? key, required this.url}) : super(key: key);

  final String? url;

  final String imageLink =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5hCPi3jmDYnzd9g2qAmBaHeilVzINkWszTg&usqp=CAU";

  String get _url => (url?.isEmpty ?? true) ? '' : url!;
  @override
  Widget build(BuildContext context) {
    return _url.isEmpty ? AssetsImages.notFound.toImage() : CachedNetworkImage(imageUrl: _url);
  }
}
