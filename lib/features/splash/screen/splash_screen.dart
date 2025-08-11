

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/assets_manager.dart';
import '../../../core/pref_helper.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 2), () {
      bool check= PrefHelper.getBool('IsOpen')?? false;
    context.go( check? '/productList':'/onboarding');

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssetsManager.onboarding2,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
