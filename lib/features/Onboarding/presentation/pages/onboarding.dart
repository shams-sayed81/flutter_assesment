import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment/core/strings_manger.dart';
import 'package:flutter_assesment/features/Onboarding/presentation/widgets/toggle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/assets_manager.dart';
import '../../../../core/colors_manager.dart';
import '../../../../core/model/onboarding.dart';
import '../../../../core/pref_helper.dart';
import '../widgets/onboarding_item.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();

}

class _OnboardingState extends State<Onboarding> {
   List<OnboardingModel> onboardingList =[
    OnboardingModel(title: StringsManager.onboardTitle1.tr(), path: AssetsManager.onboarding1),
    OnboardingModel(title: StringsManager.onboardTitle2.tr(), path: AssetsManager.onboarding2,) ,

  ];
  int index =0;
  PageController controller =PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PrefHelper.onboardingOpened('IsOpen', true);

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorsManager.primary,
         appBar: AppBar(
           backgroundColor: Colors.transparent,
           actions: [
             TextButton(onPressed: (){
               context.go('/productList');
             }, child: Text(StringsManager.skip.tr() , style: TextStyle(color: ColorsManager.secondary, fontSize: 18.sp),) ,)
           ],
         ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                    child: PageView.builder(
                      controller: controller,
                      onPageChanged: (value) {
                        index=value;
                        setState(() {

                        });
                      },
                      itemCount:onboardingList.length ,
                      itemBuilder: (context, index) => OnboardingItem(
                          onboardingModel: onboardingList[index]),
                    )),
                Toggle(),

                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Visibility(
                      visible: index!=0,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: TextButton(

                        onPressed: () {

                          controller.previousPage(
                              duration:const Duration(milliseconds: 500),
                              curve: Curves.bounceInOut);

                        },
                        child:  Text(
                         StringsManager.back.tr(),
                          style: TextStyle(
                            color: ColorsManager.secondary,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: index,
                          count:onboardingList.length,
                          effect: const ExpandingDotsEffect(
                            dotWidth: 7,
                            dotHeight: 7,
                          ),
                        ),
                      ),
                    ),




                    TextButton(
                      onPressed: () {
                        if(index ==onboardingList.length-1){
                          context.go('/productList');
                        }
                        controller.nextPage(
                            duration:const Duration(milliseconds: 500),
                            curve: Curves.bounceInOut);


                      },
                      child:  Text(
                        index == onboardingList.length-1?
                        StringsManager.finish.tr() : StringsManager.next.tr(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: ColorsManager.secondary,
                            fontSize: 16),
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
    ));
  }
}
