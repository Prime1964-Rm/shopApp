import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItemList = {};

  Map<String, CartItem> get getCartItems {
    return {..._cartItemList};
  }

  void addItem(CartItem cartItem) {
    if (_cartItemList.containsKey(cartItem.id)) {
      _cartItemList.update(
        cartItem.id,
        (value) => CartItem(
            id: value.id,
            quantity: ++value.quantity,
            basePrice: value.basePrice,
            totalPrice: value.basePrice * value.quantity,
            productName: value.productName,
            imageLink: value.imageLink),
      );
    } else {
      _cartItemList.putIfAbsent(
        cartItem.id,
        () => CartItem(
            id: cartItem.id,
            basePrice: cartItem.basePrice,
            totalPrice: cartItem.basePrice,
            quantity: 1,
            productName: cartItem.productName,
            imageLink: cartItem.imageLink),
      );
    }

    notifyListeners();
  }

  void increaseQuantity(CartItem cartItem) {
    _cartItemList.update(
      cartItem.id,
      (value) => CartItem(
        id: value.id,
        quantity: ++value.quantity,
        basePrice: value.basePrice,
        productName: value.productName,
        imageLink: value.imageLink,
        totalPrice: value.basePrice * value.quantity,
      ),
    );
    notifyListeners();
  }

  void decreaseQuantity(CartItem cartItem) {
    _cartItemList.update(
      cartItem.id,
      (value) => CartItem(
          id: value.id,
          basePrice: value.basePrice,
          quantity: --value.quantity,
          totalPrice: value.totalPrice - value.basePrice,
          productName: value.productName,
          imageLink: value.imageLink),
    );
    notifyListeners();
  }

  void removeItem(String id) {
    _cartItemList.removeWhere((key, value) => key == id);
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var v in _cartItemList.values) {
      totalPrice = totalPrice + v.totalPrice;
    }
    return totalPrice;
  }
}
// iterable.reduce((value, element) => value + element);
