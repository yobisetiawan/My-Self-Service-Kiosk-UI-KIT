import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetworkComponent extends StatelessWidget {
  final String url;
  const ImageNetworkComponent({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder:
          (context, url) => Center(
            child: SizedBox(
              height: 40, 
              child: Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
      errorWidget:
          (context, url, error) =>
              Center(child: Icon(Icons.error, color: Colors.red)),
    );
  }
}
