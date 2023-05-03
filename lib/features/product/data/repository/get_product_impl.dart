import 'dart:convert';

import 'package:clean_arch/features/product/data/service/product_services.dart';
import 'package:clean_arch/features/product/domain/entity/product.dart';
import 'package:clean_arch/features/product/domain/repository/get_product_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetProductRepo)
class GetProductRepoImpl implements GetProductRepo {
  final GetProduct _dataSource;

  GetProductRepoImpl(this._dataSource);

  @override
  Future<List<Product>> getProduct() async {
    try {
      final result = await _dataSource.getProduct();

      return result.productList;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
