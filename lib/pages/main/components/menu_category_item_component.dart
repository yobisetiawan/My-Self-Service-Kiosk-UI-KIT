import 'package:flutter/material.dart';
import 'package:myapp/components/image_network_component.dart';

class MenuCategoryItemComponent extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const MenuCategoryItemComponent({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 60),
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              border: Border.all(
                color: Color(0xFFDDDDDD), // Light gray border
              ),
            ),
            child: Opacity(
              opacity: isSelected ? 1 : 0.8,
              child: Row(
                children: [
                  SizedBox(width: 5),
                  SizedBox(
                    width: 40,
                    child:
                        imagePath != ""
                            ? ImageNetworkComponent(url: imagePath)
                            : SizedBox(),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w300,
                      ),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isSelected)
          Positioned(
            right: 5,
            top: 0,
            bottom: 0,
            child: Container(
              width: 5,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
            ),
          ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(right: 5),
            child: Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(onTap: onTap),
            ),
          ),
        ),
      ],
    );
  }
}
