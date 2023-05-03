import 'package:clean_arch/features/product/domain/entity/product.dart';

abstract class GetProductRepo {
  Future<List<Product>> getProduct();
}
