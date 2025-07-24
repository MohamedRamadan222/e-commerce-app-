

import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/core/widgets/spacing.dart';
import 'package:ecommerce/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/cubit/cart_state.dart';
import 'package:ecommerce/features/cart/widget/cart_item_widget.dart';
import 'package:ecommerce/features/cart/widget/title_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styling/app_colors.dart';
import '../../core/styling/app_styles.dart';
import '../../core/widgets/primary_button_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is LoadingCart) {
            return LoadingWidget(
              height: MediaQuery.of(context).size.height * 0.65,
            );
          }
          if (state is SuccessGettingCart) {
            // log(state.cart.toJson().toString());
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpace(28),
                    SizedBox(
                      width: 335.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        'My Cart',
                        style: AppStyles.black18BoldStyle.copyWith(
                          fontSize: 28.sp,
                        ),
                      ),
                    ),
                    const HeightSpace(20),
                    ...state.cart.products!.map((p){
                      return CartItemWidget(product: p);
            }),
                    const HeightSpace(145),
                    TitlePriceWidget(title: 'Sub-total', price: '\$ 5,870'),
                    TitlePriceWidget(title: 'VAT (%)', price: '\$ 5,870'),
                    TitlePriceWidget(title: 'Shipping fees', price: '\$ 80'),
                    const HeightSpace(20),
                    const Divider(),
                    const HeightSpace(20),
                    TotalPriceWidget(title: 'Total', price: '\$ 5,950'),
                    const HeightSpace(20),
                    PrimaryButtonWidget(
                      trailingIcon: Icon(
                        Icons.payment_outlined,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                      fontSize: 16.sp,
                      onPress: () {},
                      buttonColor: AppColors.primaryColor,
                      bordersRadius: 10.r,
                      buttonText: 'Go To Checkout',
                    ),
                    const HeightSpace(20),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
