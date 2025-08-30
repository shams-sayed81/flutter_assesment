import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment/core/helpers/strings_manger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cubit/products_view_model_cubit.dart';
import '../../../../core/helpers/colors_manager.dart';
import '../../../../core/remote/Di/di.dart';
import '../widgets/product_item.dart';

class ProductList extends StatelessWidget {
  static const String routeName ='/productList';

  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<ProductsViewModelCubit>()..getProductList(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorsManager.primary,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 70.h,
            backgroundColor: ColorsManager.appbar,
            title: Text(
              StringsManager.appbar.tr(),
              style: TextStyle(
                color: ColorsManager.secondary,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: BlocBuilder<ProductsViewModelCubit, ProductsViewModelState>(
            builder: (context, state) {
              if (state is ProductLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductSuccessState) {
                final products = state.products;
                return GridView.builder(

                  itemCount: products.length,
                  itemBuilder:

                      (context, index) {
                        final product = products[index];

                        return ProductItem(
                          product: product,
                    onTap:
                        (product) {
                      context.push(
                        '/productDetails',
                        extra: product,
                      );
                    },


                    title: products[index].title,
                    price: products[index].price,
                    url: products[index].image,
                  );},
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                );
              } else if (state is ProductErrorState) {
                return Center(child: Text(state.errorMsg));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
