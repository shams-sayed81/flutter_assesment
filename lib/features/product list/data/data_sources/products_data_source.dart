import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/features/product%20list/data/models/ProductResponse.dart';


abstract class ProductsDataSource {
  Future<Either<List<ProductResponse>, String>> getProducts();
}
