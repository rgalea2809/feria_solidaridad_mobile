import 'package:cached_network_image/cached_network_image.dart';
import 'package:feria_solidaridad/constants/assets_constants.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({super.key, required this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (imageUrl != null) {
        return CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl!,
          placeholder: (context, url) {
            return const Center(child: CircularProgressIndicator());
          },
          errorWidget: (context, url, error) {
            return Text("Image $url not found! ($error)");
          },
        );
      }

      return Image.asset(kDefaultPlaceholderImage);
    });
  }
}
