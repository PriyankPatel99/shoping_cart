import 'package:flutter/material.dart';
import 'package:shoping_cart/app/modules/home/controllers/categories_controller.dart';
import 'package:shoping_cart/app/modules/home/controllers/home_controller.dart';

class CategoriesSlider extends StatefulWidget {
  final HomeController homeController;
  final CategoriesController categoriesController;

  const CategoriesSlider(this.homeController, this.categoriesController,
      {super.key});

  @override
  createState() {
    return CategoriesSliderState();
  }
}

class CategoriesSliderState extends State<CategoriesSlider> {
  List<RadioModel> sampleData = <RadioModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(RadioModel(true, 'Best Seller'));
    for (String categoryName in widget.categoriesController.categoriesList) {
      sampleData.add(RadioModel(false, categoryName));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                for (var element in sampleData) {
                  element.isSelected = false;
                }
                sampleData[index].isSelected = true;
                if (index != 0) {
                  widget.homeController
                      .getProductCategory(sampleData[index].buttonText);
                } else {
                  widget.homeController.getProduct();
                }
              });
            },
            child: RadioItem(sampleData[index]),
          );
        });
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  const RadioItem(this._item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 40.0,
          width: 95.0,
          decoration: BoxDecoration(
              color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(_item.buttonText,
                style: TextStyle(
                    color: _item.isSelected
                        ? Colors.white
                        : Theme.of(context).primaryColorDark,
                    //fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500)),
          ),
        ),
      ],
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}
