import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/features/product%20list/data/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_sources/products_data_source.dart';
import '../../data/models/ProductResponse.dart';
@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo  {
  ProductsDataSource productsDataSource;
  @factoryMethod
  ProductsRepoImpl(this.productsDataSource);
  @override
  Future<Either<List<ProductResponse>, String>> getProducts() async {
    var result = await productsDataSource.getProducts();
    return result.fold(
          (productsResponseList) {
        return Left(productsResponseList);
      },
          (error) => Right(error),
    );
  }

}