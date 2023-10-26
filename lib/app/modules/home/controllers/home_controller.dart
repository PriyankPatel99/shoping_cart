import 'package:get/get.dart';
import 'package:shoping_cart/app/data/model/products_model.dart';
import 'package:shoping_cart/app/domian/usecases/products_usecase.dart';

class HomeController extends GetxController {
  final ProductsUsecase? productsUsecase;
  HomeController(this.productsUsecase);
  final count = 0.obs;
  List<Products> productsList = [];
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



  void increment() => count.value++;
}
