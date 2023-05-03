import 'package:bloc/bloc.dart';
import 'package:clean_arch/features/product/domain/entity/product.dart';
import 'package:clean_arch/features/product/domain/repository/get_product_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'get_product_bloc.freezed.dart';
part 'get_product_event.dart';
part 'get_product_state.dart';

@injectable
class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
  GetProductBloc(this._getProductRepo) : super(const _Initial()) {
    on<GetProductEvent>((event, emit) async {
      await event.map(getProduct: (_) => _fetchProduct(emit));
    });
  }
 Future<void> _fetchProduct(Emitter<GetProductState> emit) async {
    try {
      emit(const GetProductState.loading());
      final result = await _getProductRepo.getProduct();
      emit(GetProductState.success(productList: result));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  final GetProductRepo _getProductRepo;
}
