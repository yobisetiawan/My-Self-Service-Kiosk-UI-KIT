import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/initial_load_component.dart';

import 'package:myapp/pages/main/components/bottom_cart_component.dart';
import 'package:myapp/pages/main/components/main_category_component.dart';
import 'package:myapp/pages/main/components/main_content_component.dart';
import 'package:myapp/controllers/menu_app_controller.dart';
import 'package:myapp/pages/main/contents/product_list/content.dart';
import 'contents/home/content.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuAppController menuController = Get.find<MenuAppController>();
    return InitialLoadComponent(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: Row(
                  children: [
                    MainCategoryComponent(),
                    Expanded(
                      child: Obx(() {
                        return AnimatedSwitcher(
                          duration: const Duration(
                            milliseconds: 300,
                          ), // Animation duration
                          transitionBuilder: (
                            Widget child,
                            Animation<double> animation,
                          ) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 1), // Start from bottom
                                end:
                                    Offset.zero, // End at the original position
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve:
                                      Curves.easeInOut, // Smooth easing curve
                                ),
                              ),
                              child: FadeTransition(
                                opacity:
                                    animation, // Add fade effect for smoother transition
                                child: child,
                              ),
                            );
                          },
                          child: MainContentComponent(
                            key: ValueKey(
                              menuController.selectedMenuKey.value,
                            ), // Unique key for each menu
                            content:
                                menuController.selectedMenuKey.value == 'home'
                                    ? HomeContent()
                                    : ProductListContent(),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              BottomCartComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
