import 'package:blogpractice/View/ProductDetailUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../Controller/FetchCategoryController/FetchListOfCategory.dart';
import '../../Controller/FetchListOfProductController/FetchProduct.dart';
import '../../myUills.dart';

class FavUi extends StatefulWidget {
  const FavUi({super.key});

  @override
  State<FavUi> createState() => _FavUiState();
}

class _FavUiState extends State<FavUi> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myUtills.backgroundColor,
        body: SafeArea(
            top: true,
            bottom: true,
            left: true,
            right: true,
            child: Stack(
              children: [
                Positioned(
                    top: myUtills.getHeight(context) * 0.10,
                    left: myUtills.getHeight(context) * 0.05,
                    child: Image.asset(
                      'Assets/background.png',
                      fit: BoxFit.fill,
                    )),
                myUtills.textField(context, "No item in Fav", Colors.white, FontWeight.bold, 0.014, TextAlign.center)
              ],
            )));
  }

}
