import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/image_network_component.dart';

class ProductCardComponent extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;

  const ProductCardComponent({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 260,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xFFDDDDDD), // Light gray border (#DDD)
              width: 2, // Border width
            ),
            borderRadius: BorderRadius.circular(4), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .01),
                offset: Offset(0, 2),
                blurRadius: 2,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: ImageNetworkComponent(url: imageUrl)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rp ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
