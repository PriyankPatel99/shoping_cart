import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:shoping_cart/app/data/model/products_model.dart';
part 'retrofit_client.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com/")
abstract class RetrofitClient {
  static final RetrofitClient client = RetrofitClient(Dio());
  factory RetrofitClient(Dio dio) = _RetrofitClient;

  @GET("products")
  Future<List<Products>> getProducts();
}
