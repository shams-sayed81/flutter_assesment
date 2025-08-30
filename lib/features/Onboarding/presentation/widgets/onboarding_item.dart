import 'package:flutter/material.dart';
import 'package:flutter_assesment/core/helpers/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/model/onboarding.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const OnboardingItem({super.key,  required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:  MainAxisAlignment.spaceAround,
      children: [
        Image.asset(onboardingModel.path , height: 300.h,),
        Text(onboardingModel.title, style:
        TextStyle(color: ColorsManager.secondary,
            fontWeight: FontWeight.w700 , fontSize: 24),)
      ],
    );
  }
}
