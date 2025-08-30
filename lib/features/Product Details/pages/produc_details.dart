import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/helpers/colors_manager.dart';
import '../../../core/helpers/strings_manger.dart';
import '../../product list/data/models/ProductResponse.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName ='/productDetails';

  const ProductDetailsScreen({super.key, required ProductResponse product});

  @override
  Widget build(BuildContext context) {
    final product = GoRouterState.of(context).extra as ProductResponse?;

    if (product == null) {
      return Scaffold(
        body: Center(child: Text('No product data')),
      );
    }

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(StringsManager.productDetails.tr() , style: TextStyle( color: ColorsManager.secondary,
        fontSize: 30.sp,
        fontWeight: FontWeight.w700,),)),
      body: Padding(
        padding:  REdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl:product.image??'',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.secondary,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),            SizedBox(height: 10.h,),
              Text('Title: ${product.title}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700)),
              SizedBox(height: 10.h,),
          
              Text('Price: ${product.price}'.toString(),style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700)),
              SizedBox(height: 10.h,),
              Text('Product Description ${product.description}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700)),
              SizedBox(height: 10.h,),
              Text('Category: ${product.category} ', style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700),),
              SizedBox(height: 10.h,),
          
          
          
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}
