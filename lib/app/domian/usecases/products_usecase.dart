import 'package:dartz/dartz.dart';
import 'package:shoping_cart/app/common/failure.dart';
import 'package:shoping_cart/app/data/model/products_model.dart';
import 'package:shoping_cart/app/domian/repository/repository.dart';

class ProductsUsecase {
  final ProductsRepository repository;
  ProductsUsecase(this.repository);
  Future<Either<Failure, List<Products>>> getProductsList() {
    return repository.getProductsList();
  }
}
