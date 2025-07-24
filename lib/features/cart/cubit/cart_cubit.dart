import 'package:ecommerce/features/cart/cubit/cart_state.dart';
import 'package:ecommerce/features/cart/repo/cart_repo.dart';
import 'package:ecommerce/features/home_screen/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(InitialCartState());

  final CartRepo _cartRepo;

  Future<void> fetchCarts() async {
    emit(LoadingCart());
    final res = await _cartRepo.getUserCart();

    res.fold(
      (error) {
        emit(ErrorGettingCart(error));
      },
      (cart) {
        emit(SuccessGettingCart(cart));
      },
    );
  }

  Future<void> addingToCart({required ProductsModel product, required int quantity}) async {
    emit(AddingToCart());
    DateTime dateTime = DateTime.now();
    final res = await _cartRepo.addToCart(
      date: dateTime.toString(),
      product: product,
      quantity: quantity,
    );

    res.fold(
      (error) {
        emit(ErrorAddingToCart(error));
      },
      (cart) {
        emit(SuccessAddingToCart(cart));
      },
    );
  }
}
