import 'package:dio/dio.dart';
import 'package:shoping_cart/app/common/exception.dart';
import 'package:shoping_cart/app/data/model/products_model.dart';
import 'package:shoping_cart/app/data/retrofit/retrofit_client.dart';

abstract class ProductsDataSource {
  Future<List<Products>> getProductsList();

  Future<List<String>> getCategoriesList();

  Future<List<Products>> getProductCategoriesList(String category);
}

class ProductsDataSourceImpl implements ProductsDataSource {
  final RetrofitClient _retrofitClient = RetrofitClient(Dio());

  @override
  Future<List<Products>> getProductsList() async {
    try {
      List<Products> baseResponse = await _retrofitClient.getProducts();

      return baseResponse;
    } on DioException catch (e) {
      throw ServerException(e.response!.data['message']);
    }
  }

  @override
  Future<List<String>> getCategoriesList() async {
    try {
      List<String> baseResponse = await _retrofitClient.getCategories();
      return baseResponse;
    } on DioException catch (e) {
      throw ServerException(e.response!.data['message']);
    }
  }

  @override
  Future<List<Products>> getProductCategoriesList(String category) async {
    try {
      List<Products> baseResponse =
          await _retrofitClient.getProductCategories(category);
      return baseResponse;
    } on DioException catch (e) {
      throw ServerException(e.response!.data['message']);
    }
  }
}
