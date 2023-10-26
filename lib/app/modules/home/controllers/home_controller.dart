import 'package:get/get.dart';
import 'package:shoping_cart/app/data/model/products_model.dart';
import 'package:shoping_cart/app/domian/usecases/products_usecase.dart';

class HomeController extends GetxController {
  final ProductsUsecase? productsUsecase;

  HomeController(this.productsUsecase);

  List<Products> productsList = <Products>[].obs;

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  Future<void> getProduct() async {
    final result = await productsUsecase!.getProductsList();
    result.fold((failure) {}, (r) {
      productsList = r;
      update();
    });
  }

  Future<void> getProductCategory(String category) async {
    final result = await productsUsecase!.getProductCategoriesList(category);
    result.fold((failure) {}, (r) {
      productsList = r;
      update();
    });
  }
}
