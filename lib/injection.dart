import 'package:get_it/get_it.dart';
import 'package:shoping_cart/app/data/data_source/data_source.dart';
import 'package:shoping_cart/app/data/repository/repository_impl.dart';
import 'package:shoping_cart/app/domian/repository/repository.dart';
import 'package:shoping_cart/app/domian/usecases/products_usecase.dart';
import 'package:shoping_cart/app/modules/home/controllers/categories_controller.dart';
import 'package:shoping_cart/app/modules/home/controllers/home_controller.dart';

final locator = GetIt.instance;

void init() {
//Controller
  locator.registerFactory(() => HomeController(locator()));
  locator.registerFactory(() => CategoriesController(locator()));

//usecase
  locator.registerLazySingleton(() => ProductsUsecase(locator()));

//repository
  locator.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(productsDataSource: locator()));

//data source
  locator.registerLazySingleton<ProductsDataSource>(
      () => ProductsDataSourceImpl());
}
