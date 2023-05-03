part of 'get_product_bloc.dart';


@freezed
class GetProductState with _$GetProductState {
  const factory GetProductState.initial() = _Initial;
  const factory GetProductState.loading() = Loading;
  const factory GetProductState.success({required List<Product> productList}) = Success;
  const factory GetProductState.error({required String message}) = ProductError;
}
