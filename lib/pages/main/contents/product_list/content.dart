import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/main/components/product_card_component.dart';
import 'package:myapp/controllers/product_controller.dart';

class ProductListContent extends StatelessWidget {
  const ProductListContent({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kopi",
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              if (productController.products.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(), // Show loading indicator
                );
              }

              return SingleChildScrollView(
                child: Wrap(
                  spacing: 10, // Horizontal spacing between items
                  runSpacing: 10, // Vertical spacing between rows
                  children:
                      productController.products.map((product) {
                        return SizedBox(
                          width:
                              MediaQuery.of(context).size.width / 3 -
                              100, // Half the screen width minus padding
                          child: ProductCardComponent(
                            imageUrl: product.imageUrl,
                            title: product.title,
                            price: product.price,
                          ),
                        );
                      }).toList(),
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
