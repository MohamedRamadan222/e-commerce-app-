import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/styling/app_colors.dart';
import 'package:ecommerce/core/styling/app_styles.dart';
import 'package:ecommerce/core/utils/animated_snack_dialog.dart';
import 'package:ecommerce/core/widgets/primary_button_widget.dart';
import 'package:ecommerce/core/widgets/spacing.dart';
import 'package:ecommerce/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/cubit/cart_state.dart';
import 'package:ecommerce/features/home_screen/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  final ProductsModel product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpace(20),
                SizedBox(
                  width: 341.w,
                  height: 341.h,
                  child: Hero(
                    tag: "product${product.title}",
                    child: CachedNetworkImage(imageUrl: product.image ?? ""),
                  ),
                ),
                const HeightSpace(12),
                Text(
                  product.title ?? "",
                  style: AppStyles.black16w500Style.copyWith(fontSize: 24.sp),
                ),
                const HeightSpace(8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 18.sp),
                    const WidthSpace(6),
                    product.rating != null
                        ? Text(
                            '${product.rating!.rate}/5',
                            style: AppStyles.black15BoldStyle.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          )
                        : const SizedBox.shrink(),
                    const WidthSpace(6),
                    product.rating != null
                        ? Text(
                            '(${product.rating!.count} Reviews)',
                            style: AppStyles.grey12MediumStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                const HeightSpace(13),
                Text(
                  product.description ?? "",
                  style: AppStyles.black16w500Style.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const HeightSpace(70),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Divider(),
                  const HeightSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${product.price}\$",
                            style: AppStyles.black16w500Style.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          const HeightSpace(4),
                          Text(
                            "\$ 1,190",
                            style: AppStyles.black15BoldStyle.copyWith(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const WidthSpace(16),
                      BlocConsumer<CartCubit, CartState>(
                        listener: (context, state) {
                          if (state is SuccessAddingToCart) {
                            showAnimatedSnackDialog(
                              context,
                              message: "Product Added Successfully To Our Cart",
                              type: AnimatedSnackBarType.success,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is AddingToCart) {
                            return PrimaryButtonWidget(
                              fontSize: 16.sp,
                              onPress: () {},
                              width: MediaQuery.of(context).size.width * 0.5,
                              isLoading: true,
                              buttonColor: AppColors.primaryColor,
                              bordersRadius: 10.r,
                              buttonText: 'Add to Cart',
                            );
                          }
                          return PrimaryButtonWidget(
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                            fontSize: 16.sp,
                            onPress: () {
                              context.read<CartCubit>().addingToCart(
                                product: product,
                                quantity: 1,
                              );
                            },
                            width: MediaQuery.of(context).size.width * 0.5,
                            buttonColor: AppColors.primaryColor,
                            bordersRadius: 10.r,
                            buttonText: 'Add to Cart',
                          );
                        },
                      ),
                    ],
                  ),
                  const HeightSpace(8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
