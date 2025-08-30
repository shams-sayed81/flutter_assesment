import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment/core/helpers/colors_manager.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/assets_manager.dart';


class Toggle extends StatefulWidget {
  const Toggle({super.key});

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  int currentVal=0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
        if(context.locale.languageCode=='en'){
          currentVal=0;
        } else {
          currentVal=1;
        }
      },
    );

  }
  @override
  Widget build(BuildContext context) {
    return  AnimatedToggleSwitch<int>.rolling(
      iconOpacity: 1,
      style: ToggleStyle(

        borderColor:ColorsManager.secondary ,
        indicatorColor: ColorsManager.secondary,
      ),
      current: currentVal,
      values:const [0, 1],



      onChanged: (newVal) {

        setState(() {
          currentVal = newVal;
          if (currentVal == 0) {
            context.setLocale(const Locale('en'));
          } else {
            context.setLocale(const Locale('ar'));
          }
        });
      },
      iconList: [
        SvgPicture.asset(AssetsManager.en , width: 30, height: 30,),
        SvgPicture.asset(AssetsManager.eg, width: 30, height: 30,
        ),
      ],
    );
  }
}
