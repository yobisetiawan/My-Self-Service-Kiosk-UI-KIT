import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/btn_component.dart';
import 'package:myapp/controllers/cart_controller.dart';
import 'package:myapp/utils/formatter.dart';

class BottomCartComponent extends StatelessWidget {
  const BottomCartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCtr = Get.find<CartController>();
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(51, 0, 0, 0),
              offset: Offset(0, -4),
              blurRadius: 30,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.shopping_cart, size: 36),
                    Positioned(
                      right: -15,
                      top: -10,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Obx(() {
                          return Text(
                            '${cartCtr.totalQuantity}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                Obx(() {
                  return Text(
                    'Rp ${formatCurrency(cartCtr.totalPrice)}',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtnComponent(
                  text: "Mulai dari awal",
                  variant: 'secondary',
                  onPressed: () {
                    // Add your button action here
                    Get.back();
                  },
                ),

                SizedBox(width: 10),
                BtnComponent(
                  text: "Lihat Pesanan Saya",
                  onPressed: () {
                    // Add your button action here
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
