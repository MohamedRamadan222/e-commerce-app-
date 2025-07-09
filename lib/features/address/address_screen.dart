import 'package:ecommerce/core/widgets/spacing.dart';
import 'package:ecommerce/features/address/widgets/address_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/styling/app_styles.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          textAlign: TextAlign.center,
          'Address',
          style: AppStyles.black18BoldStyle.copyWith(fontSize: 28.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeightSpace(24),
            const Divider(color: Colors.grey),
            const HeightSpace(20),
            Text('Saved Address', style: AppStyles.black15BoldStyle),
            const HeightSpace(14),
            Expanded(
              child: ListView(
                children: [
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
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
