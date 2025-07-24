import 'package:ecommerce/core/styling/app_styles.dart';
import 'package:ecommerce/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../models/cart_model.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;

  const CartItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              highlightColor: Colors.grey[100]!,
              baseColor:  Colors.grey[300]!,
              child: Container(
                width: 83.w,
                height: 79.h,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            const WidthSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Product Item ${product.productId}', style: AppStyles.black15BoldStyle),
                      const Spacer(),
                      Icon(Icons.delete, color: Colors.red),
                    ],
                  ),
                  const HeightSpace(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ 1,190', style: AppStyles.black15BoldStyle),
                      const Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              child: Icon(Icons.add, size: 16),
                            ),
                          ),
                          WidthSpace(8),
                          Text("1", style: AppStyles.black15BoldStyle),
                          WidthSpace(8),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              child: Icon(Icons.remove, size: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
