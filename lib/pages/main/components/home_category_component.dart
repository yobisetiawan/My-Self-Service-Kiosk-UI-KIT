import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeCategoryComponent extends StatelessWidget {
  final String imageUrl;
  final String? title;

  const HomeCategoryComponent({super.key, required this.imageUrl, this.title});

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
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 10,
          right: 0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 150,
              child: Text(
                title ?? '',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
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
