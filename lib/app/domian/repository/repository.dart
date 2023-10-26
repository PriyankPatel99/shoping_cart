import 'package:dartz/dartz.dart';
import 'package:shoping_cart/app/common/failure.dart';
import 'package:shoping_cart/app/data/model/products_model.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Products>>> getProductsList();
  Future<Either<Failure, List<String>>> getCategoriesList();
  Future<Either<Failure, List<Products>>> getProductCategoriesList(String category);
}
