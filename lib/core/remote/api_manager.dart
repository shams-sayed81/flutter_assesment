
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio dio;
  ApiManager (){
    dio =Dio(
      BaseOptions(
        baseUrl: 'https://fakestoreapi.com'
      )
    );
  }

  Future<Response> getRequest({
    required String path ,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers
  }){
    return dio.get(path , queryParameters:queryParameters, options:Options(
        headers: headers
    ));
  }}