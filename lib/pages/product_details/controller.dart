import 'package:get/get.dart';
import 'package:myapp/controllers/cart_controller.dart';

 
class ProductDetailsController extends GetxController {
  var qty = 1.obs;
  final CartController cartController = Get.find<CartController>();

  void addToCart() {
    // Logic to add the product to the cart
    //cartController.addProductToCart(productDetails.value);
  }
}