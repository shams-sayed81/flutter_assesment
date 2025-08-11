part of 'products_view_model_cubit.dart';

@immutable
sealed class ProductsViewModelState {}

final class ProductsViewModelInitial extends ProductsViewModelState {}
class ProductLoadingState extends ProductsViewModelState {}
class ProductErrorState extends ProductsViewModelState {
  final String errorMsg;
  ProductErrorState(this.errorMsg);
}
class ProductSuccessState extends ProductsViewModelState {
  final List<ProductResponse> products;
  ProductSuccessState(this.products);
}