import 'package:clean_arch/core/constants/api_constants.dart';
import 'package:clean_arch/features/product/data/dto/product_model.dart';
import 'package:clean_arch/features/product/domain/entity/product.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'product_services.g.dart';

@RestApi()
@injectable
abstract class GetProduct {
  ///constructor for AuthServices
  @factoryMethod
  factory GetProduct(Dio _dio) = _GetProduct;

  /// get the  product list data from Api
  @GET(ApiConstants.getAllProduct)
  Future<ProductModel> getProduct();
}
