import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_cart/app/modules/home/controllers/categories_controller.dart';
import 'package:shoping_cart/app/modules/home/controllers/home_controller.dart';
import 'package:shoping_cart/app/modules/home/widget/IconContainer.dart';
import 'package:shoping_cart/app/modules/home/widget/product_grid.dart';
import 'package:shoping_cart/app/modules/home/widget/categories_slider.dart';
import 'package:shoping_cart/injection.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController homeController = Get.put(locator<HomeController>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 25, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconContainer(
                      pressed: () {
                        print("object");
                      },
                      picture: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Products",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    IconContainer(
                      pressed: () {
                        print("object");
                      },
                      picture: Icon(
                        Icons.shopping_bag_outlined,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                height: 50,
                child: GetBuilder<CategoriesController>(
                    init: locator<CategoriesController>(),
                    builder: (controller) {
                      return CategoriesSlider(
                        homeController,
                        controller,
                        key: GlobalKey(),
                      );
                    }),
              ),
              GetBuilder<HomeController>(builder: (controller) {
                return ProductInfoCardGridView(data: controller.productsList);
              })
            ],
          ),
        ),
      ),
    );
  }
}
