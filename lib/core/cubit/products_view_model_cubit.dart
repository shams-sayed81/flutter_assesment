import 'package:bloc/bloc.dart';
import 'package:flutter_assesment/features/product%20list/data/models/ProductResponse.dart';
import 'package:flutter_assesment/features/product%20list/data/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';


part 'products_view_model_state.dart';

@injectable
class ProductsViewModelCubit extends Cubit<ProductsViewModelState> {
  final ProductsRepo productsRepo;

  ProductsViewModelCubit(this.productsRepo) : super(ProductsViewModelInitial());

  Future<void> getProductList() async {

    var result = await productsRepo.getProducts();
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
