import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/remote/api_manager.dart';

import 'package:flutter_assesment/features/product%20list/data/models/ProductResponse.dart';

import 'package:injectable/injectable.dart';

import '../products_data_source.dart';
@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl implements ProductsDataSource{
  ApiManager apiManager;
  @factoryMethod
  ProductsDataSourceImpl (this.apiManager);
  
  @override
  Future<Either<List<ProductResponse>, String>>getProducts () async{

     try{
     var result = await apiManager.getRequest(path: '/products');
     List<ProductResponse> products = (result.data as List)
         .map((item) => ProductResponse.fromJson(item))
         .toList();

     return Left(products);
     }
     catch (e){
       return Right(e.toString());
     }
  }
}