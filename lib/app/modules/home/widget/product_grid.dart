import 'package:flutter/material.dart';
import 'package:shoping_cart/app/common/colors.dart';
import 'package:shoping_cart/app/data/model/products_model.dart';

class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard({
    Key? key,
    required this.products,
  }) : super(key: key);

  final Products products;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                products.image.toString(),
                width: 80,
                height: 80.0,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              width: 150,
              height: 81,
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    products.category.toString(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: isDarkMode
                            ? AppColors.subtextdark
                            : AppColors.subtextlight),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "\$${products.price}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 8)),
                Container(
                    height: 32,
                    width: 88,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Add",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.add, color: AppColors.fullbutton, size: 18)
                      ],
                    )),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Customizable",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode
                          ? AppColors.subtextdark
                          : AppColors.subtextlight),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductInfoCardGridView extends StatelessWidget {
  final List<Products> data;

  const ProductInfoCardGridView({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) => ProductInfoCard(products: data[index]),
    );
  }
}
