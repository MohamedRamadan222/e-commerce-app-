import 'package:ecommerce/features/cart/models/cart_model.dart';

abstract class CartState {}

class InitialCartState extends CartState {}

class LoadingCart extends CartState {}

class SuccessGettingCart extends CartState {
  final CartModel cart;

  SuccessGettingCart(this.cart);
}

class ErrorGettingCart extends CartState {
  final String message;

  ErrorGettingCart(this.message);
}

class AddingToCart extends CartState {}

class SuccessAddingToCart extends CartState {
  final CartModel cart;

  SuccessAddingToCart(this.cart);
}

class ErrorAddingToCart extends CartState {
  final String message;

  ErrorAddingToCart(this.message);
}
