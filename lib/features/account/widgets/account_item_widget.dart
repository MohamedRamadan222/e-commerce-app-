import 'package:ecommerce/core/styling/app_styles.dart';
import 'package:ecommerce/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountItemWidget extends StatelessWidget {
  final String? title;
  final String? iconPath;
  final VoidCallback? onTap;

  const AccountItemWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        child: Row(
          children: [
            Row(
              children: [
                iconPath == null
                    ? const SizedBox.shrink()
                    : Image.asset(iconPath!, width: 25.sp, height: 25.sp),
                const WidthSpace(16),
                Text(
                  title ?? "",
                  style: AppStyles.black15BoldStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16.sp,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
