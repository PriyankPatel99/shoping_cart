import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_cart/app/common/colors.dart';
import 'package:shoping_cart/app/data/model/products_model.dart';
import 'package:shoping_cart/app/modules/home/controllers/home_controller.dart';
import 'package:shoping_cart/injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<HomeController>(
        init: locator<HomeController>(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            bottomSheet: Container(
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width,
                color: isDarkMode
                    ? Theme.of(context).primaryColor
                    : AppColors.bottomsheet,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Container(
                        height: 48,
                        width: 104,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(18)),
                        child: Center(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    print("Home");
                                  },
                                  icon: const Icon(Icons.home)),
                              // SvgPicture.asset(
                              //   "assets/home.svg",
                              //   color: AppColors.fullbutton,
                              // )),
                              Text(
                                "Home",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.fullbutton),
                              )
                            ],
                          ),
                        )),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          // print("search");
                        },
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: isDarkMode
                              ? AppColors.subtextdark
                              : AppColors.subtextlight,
                        )),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        // print("begs");
                      },
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        size: 30,
                        color: isDarkMode
                            ? AppColors.subtextdark
                            : AppColors.subtextlight,
                      ),
                    ),
                    const Spacer(),
                    /*   IconButton(
                    onPressed: () {
                      print("User");
                    },
                    
                    icon: Icon(
                      Icons.person_outline_outlined,
                      size: 30,
                      color: isDarkMode
                          ? AppColors.subtextdark
                          : AppColors.subtextlight,
                    ),
                  ),*/
                    CircleAvatar(
                      backgroundImage: const NetworkImage(
                        "https://picsum.photos/200",
                      ),
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          //  print("Patel Priyank");
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                )),
            body: SingleChildScrollView(
                child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 34.67, left: 15, bottom: 35),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 26,
                          color: AppColors.fullbutton,
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Home",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Raj Path club",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: isDarkMode
                                      ? AppColors.subtextdark
                                      : AppColors.subtextlight),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 130,
                    //   child: CategorySlider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 18),
                    child: Row(
                      children: [
                        const Text(
                          "Popular Product",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              ///   print("Shorting");
                            },
                            icon: const Icon(Icons.sort)),
                        //  SvgPicture.asset("assets/options.svg",
                        //     color: Theme.of(context).primaryColorDark))
                      ],
                    ),
                  ),
                  FileInfoCardGridView(data: controller.productsList),
                  const SizedBox(
                    height: 64,
                  )
                ],
              ),
            )),
          );
        });
  }
}

class FileInfoCard extends StatelessWidget {
  Products products;
  FileInfoCard({
    Key? key,
    required this.products,
  }) : super(key: key);

  // final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(products.image!.toString()),
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(
              width: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.50),
              child: SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Text(
                            products.title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "50% OFF",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.fullbutton),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xFFFFB200),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          products.rating!.rate.toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? AppColors.subtextdark
                                  : Colors.black),
                        ),
                        Text(
                          " • Chienese  • ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: isDarkMode
                                  ? AppColors.subtextdark
                                  : AppColors.subtextlight),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Icon(
                          Icons.watch_later_outlined,
                          size: 12,
                          color: isDarkMode
                              ? AppColors.subtextdark
                              : AppColors.subtextlight,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "15 min",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: isDarkMode
                                  ? AppColors.subtextdark
                                  : AppColors.subtextlight),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FileInfoCardGridView extends StatelessWidget {
  List<Products> data;
  FileInfoCardGridView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) => FileInfoCard(
        products: data[index],
      ),
    );
  }
}
