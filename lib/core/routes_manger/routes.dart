import 'package:flutter_assesment/features/product%20list/presentation/widgets/product_item.dart';
import 'package:flutter_assesment/features/splash/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/Onboarding/presentation/pages/onboarding.dart';
import '../../features/Product Details/pages/produc_details.dart';
import '../../features/product list/data/models/ProductResponse.dart';
import '../../features/product list/presentation/pages/product_list.dart';
final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/productList',
      builder: (context, state) => ProductList(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => Onboarding(),
    ),
    GoRoute(
      path: '/productItem',
      builder: (context, state) => ProductItem(),
    ),
    GoRoute(
      path: '/productDetails',
      builder: (context, state) {
        final product = state.extra as ProductResponse;
        return ProductDetailsScreen(product: product);
      },
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),

  ],
);

/*
onboardingOpened ?'/productList' :
 */