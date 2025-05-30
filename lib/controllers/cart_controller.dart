import 'package:get/get.dart';
import 'package:myapp/data/cart.dart';
import 'package:myapp/data/product.dart';

class CartController extends GetxController {
  var carts = <Cart>[].obs;
  var typeOrder = 'takeaway'.obs;

  int get totalQuantity => carts.fold(0, (sum, cart) => sum + cart.quantity);
  double get totalPrice =>
      carts.fold(0, (sum, cart) => sum + (cart.product.price * cart.quantity));

  void addProductToCart(Product product, int qty) {
    // Check if the product already exists in the cart
    var existingCart = carts.firstWhereOrNull(
      (cart) => cart.product.id == product.id,
    );

    if (existingCart != null) {
      // If the product exists, update the quantity
      existingCart.quantity += qty;
      carts.refresh(); // Notify observers about the change
    } else {
      // If the product doesn't exist, add it to the cart
      carts.add(Cart(product: product, quantity: qty));
    }
  }

  void removeCartProduct(Cart c) {
    // Remove the product from the cart
    carts.removeWhere((cart) => cart.product.id == c.product.id);

    // Notify observers about the change
    carts.refresh();
  }

  void cleanCart() {
    carts.value = [];
  }

  void incrementQuantity(Cart cart) {
    cart.quantity++;
    carts.refresh(); // Notify observers about the change
  }

  void decrementQuantity(Cart cart) {
    if (cart.quantity > 1) {
      cart.quantity--;
      carts.refresh(); // Notify observers about the change
    } 
    // else {
    //   removeCartProduct(cart); // Remove the product if quantity is 0
    // }
  }

  //i want update the qty ++
}
