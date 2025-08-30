import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment/core/helpers/colors_manager.dart';
import 'package:flutter_assesment/features/product%20list/data/models/ProductResponse.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final String? url;
  final String? title;
  final num? price;
  final ProductResponse? product;
  final Function(ProductResponse)? onTap;
  const ProductItem({super.key, this.url, this.title, this.price , this.onTap , this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (onTap != null && product != null) {
          onTap!(product!);
        }      },
      child: Card(
        margin: EdgeInsets.all(10.sp),
        elevation: 4,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  width: double.infinity,
                   fit: BoxFit.fill,
                  imageUrl:url!,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.secondary,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              title ?? '',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ColorsManager.secondary, fontSize: 20),
            ),
            SizedBox(height: 10.h),
            Text(
              price.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ColorsManager.secondary, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
