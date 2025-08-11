import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/features/product%20list/data/models/ProductResponse.dart';


abstract class ProductsRepo {
  Future<Either<List<ProductResponse>, String>> getProducts();

}