import 'package:ecommerce/core/routing/app_routs.dart';
import 'package:ecommerce/core/styling/app_assets.dart';
import 'package:ecommerce/core/styling/app_colors.dart';
import 'package:ecommerce/core/widgets/primary_button_widget.dart';
import 'package:ecommerce/core/widgets/spacing.dart';
import 'package:ecommerce/features/account/widgets/account_item_widget.dart';
import 'package:ecommerce/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              onTap: () {
                shoLogoutDialog(context);
              },
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

  void shoLogoutDialog(BuildContext parentContext) {
    showDialog(
      context: parentContext,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: SizedBox(
            height: 400.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeightSpace(20),
                  Icon(
                    Icons.warning_amber_outlined,
                    color: Colors.redAccent,
                    size: 50.sp,
                  ),
                  const HeightSpace(20),
                  Text(
                    'Logout',
                    style: AppStyles.black16w500Style.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const HeightSpace(8),
                  Text(
                    'Are you sure you want to logout?',
                    style: AppStyles.grey12MediumStyle,
                  ),
                  const HeightSpace(16),
                  PrimaryButtonWidget(
                    buttonText: 'Yes Logout',
                    onPress: () {
                      parentContext.read<AuthCubit>().logout();
                      parentContext.pushReplacementNamed(AppRoutes.loginScreen);
                    },
                    buttonColor: AppColors.primaryColor,
                  ),
                  const HeightSpace(16),
                  PrimaryButtonWidget(
                    buttonText: 'No Cancel',
                    onPress: () {
                      context.pop();
                    },
                    buttonColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
