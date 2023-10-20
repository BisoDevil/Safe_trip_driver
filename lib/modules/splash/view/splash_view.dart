import 'package:flutter/material.dart';
import 'package:safe_trip_driver_app/utils/extensions.dart';
import '../../../core/app_colors.dart';
import '../../../constants/app_paths.dart';
import '../../../core/app_values.dart';
import '../controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (splashController) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssetsPaths.appLogo , width: 80.w,),
              SizedBox(height: 5.h),
              const SizedBox(
                height: AppSizes.circularProgressIndicatorHeight,
                width: AppSizes.circularProgressIndicatorWidth,
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  strokeWidth: AppSizes.circularProgressIndicatorStrokeWidth,
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
