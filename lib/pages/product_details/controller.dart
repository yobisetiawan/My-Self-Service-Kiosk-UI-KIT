import 'package:get/get.dart';
import 'package:myapp/controllers/cart_controller.dart';
import 'package:myapp/data/product.dart';

class ProductDetailsController extends GetxController {
  var qty = 1.obs;
  final CartController cartController = Get.find<CartController>();
  var hasSubmited = false.obs;

  void addToCart(Product product) {
    cartController.addProductToCart(product, qty.value);
    hasSubmited.value = true;

    Future.delayed(Duration(seconds: 2), () {
      Get.back();
    });
  }
}
