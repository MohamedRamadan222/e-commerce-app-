import 'package:ecommerce/core/styling/app_colors.dart';
import 'package:ecommerce/core/styling/app_styles.dart';
import 'package:ecommerce/core/widgets/primary_button_widget.dart';
import 'package:ecommerce/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
                Container(
                  width: 341.w,
                  height: 341.h,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                const HeightSpace(12),
                Text(
                  'T Shirt',
                  style: AppStyles.black16w500Style.copyWith(fontSize: 24.sp),
                ),
                const HeightSpace(8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 18.sp),
                    const WidthSpace(6),
                    Text(
                      '4.5/5',
                      style: AppStyles.black15BoldStyle.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const WidthSpace(6),
                    Text(
                      '(45 Reviews)',
                      style: AppStyles.grey12MediumStyle.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const HeightSpace(13),
                Text(
                  'Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them',
                  style: AppStyles.black16w500Style.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const HeightSpace(70)
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
                            'Price',
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
                      PrimaryButtonWidget(
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 16.sp,
                        ),
                        fontSize: 16.sp,
                        onPress: () {},
                        width: MediaQuery.of(context).size.width * 0.5,
                        buttonColor: AppColors.primaryColor,
                        bordersRadius: 10.r,
                        buttonText: 'Add to Cart',
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
