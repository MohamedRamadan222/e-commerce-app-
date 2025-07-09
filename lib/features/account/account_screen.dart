import 'package:ecommerce/core/routing/app_routs.dart';
import 'package:ecommerce/core/styling/app_assets.dart';
import 'package:ecommerce/core/widgets/spacing.dart';
import 'package:ecommerce/features/account/widgets/account_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/styling/app_styles.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeightSpace(28),
          SizedBox(
            width: 335.w,
            child: Text(
              textAlign: TextAlign.center,
              'Account',
              style: AppStyles.black18BoldStyle.copyWith(fontSize: 28.sp),
            ),
          ),
          const HeightSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Divider(color: Colors.grey),
          ),
          const HeightSpace(18),
          AccountItemWidget(
            title: 'My Orders',
            iconPath: AppAssets.box,
            onTap: () {},
          ),
          const HeightSpace(18),
          const Divider(color: Color(0xffAAAAAA), thickness: 8),
          const HeightSpace(18),
          AccountItemWidget(
            title: 'My Details',
            iconPath: AppAssets.details,
            onTap: () {},
          ),
          const HeightSpace(18),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Divider(color: Colors.grey),
          ),
          const HeightSpace(18),
          AccountItemWidget(
            title: 'Address Book',
            iconPath: AppAssets.address,
            onTap: () {
              context.pushNamed(AppRoutes.addressScreen);
            },
          ),
          const HeightSpace(18),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Divider(color: Colors.grey),
          ),
          const HeightSpace(18),
          AccountItemWidget(
            title: 'FAQs',
            iconPath: AppAssets.question,
            onTap: () {},
          ),
          const HeightSpace(18),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Divider(color: Colors.grey),
          ),
          const HeightSpace(18),
          AccountItemWidget(
            title: 'Help Center',
            iconPath: AppAssets.headphones,
            onTap: () {},
          ),
          const HeightSpace(18),
          const Divider(color: Color(0xffE6E6E6), thickness: 8),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.logout_outlined, color: Colors.red, size: 25.sp),
                  const WidthSpace(8),
                  Text(
                    'Logout',
                    style: AppStyles.black15BoldStyle.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
