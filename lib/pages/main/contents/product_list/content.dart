import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/menu_app_controller.dart';
import 'package:myapp/pages/main/components/product_card_component.dart';
import 'package:myapp/controllers/product_controller.dart';
import 'package:myapp/routes.dart';

class ProductListContent extends StatelessWidget {
  const ProductListContent({super.key});

  @override
  Widget build(BuildContext context) {
    final productCtr = Get.find<ProductController>();
    final menuCtr = Get.find<MenuAppController>();

    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Text(
              menuCtr.selectedMenu.value?.title ?? '',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          }),

          SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              if (productCtr.selectedProducts.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),
                  ), // Show loading indicator
                );
              }

              return SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 10, // Horizontal spacing between items
                    runSpacing: 10, // Vertical spacing between rows
                    children:
                        productCtr.selectedProducts.map((product) {
                          return SizedBox(
                            width:
                                MediaQuery.of(context).size.width / 3 -
                                100, // Half the screen width minus padding
                            child: ProductCardComponent(
                              imageUrl: product.imageUrl,
                              title: product.title,
                              price: product.price,
                              onTap: () {
                                productCtr.setProductDetails(product);
                                Get.toNamed(AppRoutes.productDetails);
                              },
                            ),
                          );
                        }).toList(),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 180),
        ],
      ),
    );
  }
}
