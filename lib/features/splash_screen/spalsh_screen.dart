import 'dart:async';

import 'package:ecommerce/core/styling/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/routing/app_routs.dart';
import '../../core/utils/service_locator.dart';
import '../../core/utils/storage_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );
    waitAnimationAndNavigate();
    super.initState();
  }

  Future<void> waitAnimationAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    sl<StorageHelper>().getToken().then((value) {
      if (value != null && value.isNotEmpty) {
          context.pushReplacementNamed(AppRoutes.mainScreen);
      } else {
        context.pushReplacementNamed(AppRoutes.loginScreen);
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(AppAssets.logo, width: 200.w, height: 200.h),
        ),
      ),
    );
  }
}
