import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/btn_component.dart';
import 'package:myapp/components/image_network_component.dart';
import 'package:myapp/controllers/product_controller.dart';
import 'package:myapp/pages/product_details/controller.dart';
import 'package:myapp/utils/formatter.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ProductDetailsController());
    final productCtr = Get.find<ProductController>();
    final product = productCtr.productDetails.value;
    if (product == null) {
      return Scaffold(body: Center(child: Text("Product not found")));
    }

    return Obx(() {
      if (ctr.hasSubmited.value) {
        return ProductSubmitedToCart(total: product.price * ctr.qty.value);
      }

      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: 500,
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Color(0xFFDDDDDD), // Light gray border (#DDD)
                width: 1, // Border width
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .05),
                  offset: Offset(0, 2),
                  blurRadius: 20,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ImageNetworkComponent(url: product.imageUrl),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    product.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        formatCurrency(product.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: BtnComponent(
                    text: 'Modifikasi',
                    onPressed: () {},
                    variant: 'secondary',
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: BtnComponent(
                          text: '-',
                          onPressed: () {
                            if (ctr.qty.value > 1) {
                              ctr.qty.value--;
                            }
                          },
                          variant: 'secondary',
                        ),
                      ),
                      Expanded(
                        child: BtnComponent(
                          text: ctr.qty.value.toString(),
                          variant: 'secondary',
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: BtnComponent(
                          text: '+',
                          onPressed: () {
                            ctr.qty.value++;
                          },
                          variant: 'secondary',
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: BtnComponent(
                        text: 'Batal',
                        onPressed: () {
                          Get.back();
                        },
                        variant: 'secondary',
                      ),
                    ),
                    Expanded(
                      child: BtnComponent(
                        text: 'Tambah Pada Pesanan',
                        onPressed: () {
                          ctr.addToCart(product);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class ProductSubmitedToCart extends StatelessWidget {
  final double total;
  const ProductSubmitedToCart({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 400,
              child: Text(
                'Menu ditambahkan dalam pesananan',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text('Jumlah total telah diperbaharui'),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rp ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  formatCurrency(total),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
