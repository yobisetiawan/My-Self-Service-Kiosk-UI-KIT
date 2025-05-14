import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/btn_component.dart';
import 'package:myapp/components/image_network_component.dart';
import 'package:myapp/configs/app_color.dart';
import 'package:myapp/controllers/cart_controller.dart';
import 'package:myapp/data/cart.dart';
import 'package:myapp/utils/formatter.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Image.asset(
                    'assets/images/icons/logo_mcd.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Pesanan Kamu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(color: Colors.white, child: CartListView()),
          ),
          Container(height: 1, color: AppColor.border),
          BottomTotalOrder(),
        ],
      ),
    );
  }
}

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartCtr = Get.find<CartController>();

    return Obx(() {
      if (cartCtr.carts.isEmpty) {
        return Center(
          child: Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        );
      }

      return ListView.builder(
        padding: EdgeInsets.all(30),
        itemCount: cartCtr.carts.length,
        itemBuilder: (context, index) {
          final cart = cartCtr.carts[index];
          return CartProductItem(cart: cart);
        },
      );
    });
  }
}

class CartProductItem extends StatelessWidget {
  final Cart cart;
  const CartProductItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final CartController cartCtr = Get.find<CartController>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          BtnComponent(
            text: 'Remove',
            onPressed: () {
              cartCtr.removeCartProduct(cart);
            },
            variant: 'secondary',
            size: null,
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 100,
            child: ImageNetworkComponent(url: cart.product.imageUrl),
          ),
          Expanded(
            child: Text(
              cart.product.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(
            width: 220,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtnComponent(
                  text: '-',
                  onPressed: () {
                    cartCtr.decrementQuantity(cart);
                  },
                  variant: 'secondary',
                  size: null,
                ),
                BtnComponent(
                  text: cart.quantity.toString(),
                  variant: 'secondary',
                  size: null,
                ),
                BtnComponent(
                  text: '+',
                  onPressed: () {
                    cartCtr.incrementQuantity(cart);
                  },
                  variant: 'secondary',
                  size: null,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 120,
            child: Text(
              'Rp ${formatCurrency(cart.quantity * cart.product.price)}',
              textAlign: TextAlign.end,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomTotalOrder extends StatelessWidget {
  const BottomTotalOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartCtr = Get.find<CartController>();
    return Container(
      padding: EdgeInsets.all(30),
      width: double.infinity,

      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 200, height: 1),
              SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Obx(() {
                      return Text(
                        'Rp ${formatCurrency(cartCtr.totalPrice)}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20),
          Row(
            children: [
              BtnComponent(
                text: 'Order More',
                onPressed: () {
                  Get.back();
                },
                variant: 'secondary',
              ),
              SizedBox(width: 20),
              Expanded(
                child: BtnComponent(text: 'Complete Order', onPressed: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
