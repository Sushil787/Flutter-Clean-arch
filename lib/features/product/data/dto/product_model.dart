import 'package:clean_arch/features/product/domain/entity/product.dart';

class ProductModel {
  final List<Product> productList;
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        productList: (json['products'] as List<dynamic>)
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  ProductModel({required this.productList});
}
