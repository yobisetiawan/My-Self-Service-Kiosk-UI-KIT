import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/image_network_component.dart';

class TouchableCardComponent extends StatelessWidget {
  final String imageUrl;
  final String? title;
  final double? price;

  const TouchableCardComponent({
    super.key,
    required this.imageUrl,
    this.title,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .01),
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                border: Border.all(color: const Color(0xFFDDDDDD), width: 2),
              ),
              child: ImageNetworkComponent(url: imageUrl),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                if (kDebugMode) {
                  print("TouchableCardComponent tapped!");
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
