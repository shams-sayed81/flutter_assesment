import 'package:bloc/bloc.dart';
import 'package:flutter_assesment/features/product%20list/data/models/ProductResponse.dart';
import 'package:flutter_assesment/features/product%20list/domain/use_cases/products_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';


part 'products_view_model_state.dart';

@injectable
class ProductsViewModelCubit extends Cubit<ProductsViewModelState> {
  final ProductsUseCase productsUseCase;

  ProductsViewModelCubit(this.productsUseCase) : super(ProductsViewModelInitial());

  Future<void> getProductList() async {

    var result = await productsUseCase.call();
    result.fold(
          (productsList) {
        emit(ProductSuccessState(productsList));
      },
          (error) {
        emit(ProductErrorState(error));
      },
    );
  }
}
