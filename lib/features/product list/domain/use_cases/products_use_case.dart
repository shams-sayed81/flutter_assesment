import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/features/product%20list/data/models/ProductResponse.dart';
import 'package:flutter_assesment/features/product%20list/data/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsUseCase {
  ProductsRepo productsRepo;
  @factoryMethod
  ProductsUseCase(this.productsRepo);
  Future<Either<List<ProductResponse>, String>> call()=>
      productsRepo.getProducts();
}