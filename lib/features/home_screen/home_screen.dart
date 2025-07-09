import 'package:ecommerce/core/routing/app_routs.dart';
import 'package:ecommerce/core/styling/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_text_field.dart';
import 'package:ecommerce/features/home_screen/widgets/category_item_widget.dart';
import 'package:ecommerce/features/home_screen/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/styling/app_styles.dart';
import '../../core/widgets/spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpace(28),
          SizedBox(
            width: 335.w,
            child: Text(
              'Discover',

              style: AppStyles.black18BoldStyle.copyWith(fontSize: 28.sp),
            ),
          ),
          const HeightSpace(16),
          Row(
            children: [
              CustomTextField(width: 270.w, hintText: "Search for clothes..."),
              WidthSpace(8),
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.tune_outlined, color: Colors.white),
              ),
            ],
          ),
          HeightSpace(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItemWidget(categoryName: 'All'),
                CategoryItemWidget(categoryName: 'All'),
                CategoryItemWidget(categoryName: 'All'),
                CategoryItemWidget(categoryName: 'All'),
                CategoryItemWidget(categoryName: 'All'),
                CategoryItemWidget(categoryName: 'All'),
              ],
            ),
          ),
          HeightSpace(24),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.sp,
                crossAxisSpacing: 16.sp,
                childAspectRatio: 0.78,
              ),
              children: [
                ProductItemWidget(
                  title: 'Shoes',
                  price: '1190 \$',
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRoutes.productScreen);
                  },
                ),
                ProductItemWidget(title: 'Shoes', price: '1190 \$'),
                ProductItemWidget(title: 'Shoes', price: '1190 \$'),
                ProductItemWidget(title: 'Shoes', price: '1190 \$'),
                ProductItemWidget(title: 'Shoes', price: '1190 \$'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
