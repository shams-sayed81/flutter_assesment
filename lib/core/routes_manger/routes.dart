import 'package:go_router/go_router.dart';

import '../../features/Onboarding/presentation/pages/onboarding.dart';
import '../../features/Product Details/pages/produc_details.dart';
import '../../features/product list/data/models/ProductResponse.dart';
import '../../features/product list/presentation/pages/product_list.dart';

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: ProductList.routeName,
      builder: (context, state) => ProductList(),
    ),
    GoRoute(
      path: Onboarding.routeName,
      builder: (context, state) => Onboarding(),
    ),

    GoRoute(
      path: ProductDetailsScreen.routeName,
      builder: (context, state) {
        final product = state.extra as ProductResponse;
        return ProductDetailsScreen(product: product);
      },
    ),


  ],
);

/*
onboardingOpened ?'/productList' :
 */