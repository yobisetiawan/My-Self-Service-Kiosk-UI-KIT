import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/data/menu.dart';
import 'package:myapp/pages/main/components/menu_category_item_component.dart';
import 'package:myapp/controllers/menu_app_controller.dart';

final List<MenuItem> defaultMenu = [
  MenuItem(
    title: 'Home',
    key: 'home',
    imageUrl: 'https://s7d1.scene7.com/is/image/mcdonalds/FeaturedFavorites_NavImage:category-panel-left-desktop',
  ),
];

class MainCategoryComponent extends StatelessWidget {
  const MainCategoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<MenuAppController>();

    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: Color(0xFFDDDDDD),
            width: 1, // Border width
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(26),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/icons/logo_mcd.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          ...defaultMenu.map((item) {
            return Obx(() {
              return MenuCategoryItemComponent(
                title: item.title,
                imagePath: item.imageUrl,
                isSelected: menuController.selectedMenuKey.value == item.key,
                onTap: () {
                  menuController.selectedMenuKey(item.key);
                },
              );
            });
          }),
          SizedBox(height: 15),
          Obx(() {
            return Column(
              children:
                  menuController.menus.map((item) {
                    return MenuCategoryItemComponent(
                      title: item.title,
                      imagePath: item.imageUrl,
                      isSelected:
                          menuController.selectedMenuKey.value == item.key,
                      onTap: () {
                        menuController.selectedMenuKey(item.key);
                      },
                    );
                  }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
