import 'package:get/get.dart';
import 'package:shoping_cart/app/domian/usecases/products_usecase.dart';

class CategoriesController extends GetxController {
  final ProductsUsecase? productsUsecase;

  CategoriesController(this.productsUsecase);

  List<String> categoriesList = <String>[].obs;

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  Future<void> getCategory() async {
    final result = await productsUsecase!.getCategoriesList();
    result.fold((failure) {}, (r) {
      categoriesList = r;
      update();
    });
  }
}
