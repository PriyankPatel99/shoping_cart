import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shoping_cart/app/common/exception.dart';
import 'package:shoping_cart/app/common/failure.dart';
import 'package:shoping_cart/app/data/model/products_model.dart';
import 'package:shoping_cart/app/domian/repository/repository.dart';

import '../data_source/data_source.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource productsDataSource;
  ProductsRepositoryImpl({required this.productsDataSource});

  @override
  Future<Either<Failure, List<Products>>> getProductsList() async {
    try {
      final result = await productsDataSource.getProductsList();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.mes));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
    } on SocketDirection {
      return const Left(CommonFailure('SocketDirection exeption'));
    }
  }
}
