import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/product_controller.dart';
import 'package:myapp/pages/main/components/home_category_component.dart';
import 'package:myapp/pages/main/components/product_card_component.dart';
import 'package:myapp/pages/main/components/touchable_card_component.dart';
import 'package:myapp/routes.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.find<ProductController>();
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Pesan Sekarang",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Obx(
              () => Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    ctr.mainCategories.map((category) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 136,
                        child: HomeCategoryComponent(
                          imageUrl: category.imageUrl,
                          title: category.title,
                        ),
                      );
                    }).toList(),
              ),
            ),

            SizedBox(height: 10),
            TouchableCardComponent(
              imageUrl:
                  "https://d2vuyvo9qdtgo9.cloudfront.net/home-banners/April2025/bZBqwzU0hPuyF96I61U2.webp",
            ),
            SizedBox(height: 60),
            Text(
              "Rekomendasi",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Obx(
              () => Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    ctr.productRecomendations.map((item) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 3 - 94,
                        child: ProductCardComponent(
                          imageUrl: item.imageUrl,
                          title: item.title,
                          price: item.price,
                          onTap: () {
                            ctr.setProductDetails(item);
                            Get.toNamed(AppRoutes.productDetails);
                          },
                        ),
                      );
                    }).toList(),
              ),
            ),
            SizedBox(height: 250),
          ],
        ),
      ),
    );
  }
}
