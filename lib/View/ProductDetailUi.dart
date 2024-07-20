import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../Controller/FetchCategoryController/FetchListOfCategory.dart';
import '../../Controller/FetchListOfProductController/FetchProduct.dart';
import '../../myUills.dart';

class ProductDetailUi extends StatefulWidget {
  const ProductDetailUi({super.key});

  @override
  State<ProductDetailUi> createState() => _ProductDetailUiState();
}

class _ProductDetailUiState extends State<ProductDetailUi> {
  FetchListOfCategory fetchListOfCategory = FetchListOfCategory();
  FetchProduct fetchProduct = FetchProduct();

  @override
  void initState() {
    fetchListOfCategory.fetchCategory();
    fetchProduct.fetchProduct();
    super.initState();
  }

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
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            height: myUtills.getHeight(context) * 0.04,
                            margin: EdgeInsets.only(
                                left: myUtills.getHeight(context) * 0.03),
                            width: myUtills.getWidth(context) * 0.10,
                            decoration: BoxDecoration(
                                color: myUtills.buttonBackGround,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10))),
                            child: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.white,
                              size: myUtills.getHeight(context) * 0.03,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                right: myUtills.getHeight(context) * 0.20),
                            child: myUtills.textField(
                                context,
                                "Detail",
                                Colors.white,
                                FontWeight.bold,
                                0.020,
                                TextAlign.left)),
                      ],
                    ),
                    Gap(myUtills.getHeight(context) * 0.02),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Image.asset('Assets/bike.png'),
                    ),
                    Gap(
                      myUtills.getHeight(context) * 0.20,
                    ),
                    Container(
                      height: myUtills.getHeight(context) * 0.47,
                      decoration: const BoxDecoration(
                          color: Color(0xff353F54),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    // signInWithGoogle();
                                  },
                                  child: Container(
                                      height:
                                          myUtills.getHeight(context) * 0.06,
                                      width: myUtills.getWidth(context) * 0.40,
                                      decoration: BoxDecoration(
                                          color: myUtills.backgroundColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                          child: myUtills.textField(
                                              context,
                                              "Description",
                                              Colors.white,
                                              FontWeight.bold,
                                              0.016,
                                              TextAlign.center)))),
                              TextButton(
                                  onPressed: () async {
                                    // signInWithGoogle();
                                  },
                                  child: Container(
                                      height:
                                          myUtills.getHeight(context) * 0.06,
                                      width: myUtills.getWidth(context) * 0.40,
                                      decoration: BoxDecoration(
                                          color: myUtills.backgroundColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                          child: myUtills.textField(
                                              context,
                                              "Specification",
                                              Colors.white,
                                              FontWeight.bold,
                                              0.016,
                                              TextAlign.center)))),
                            ],
                          ),
                          Gap(
                            myUtills.getHeight(context) * 0.02,
                          ),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(left: myUtills.getHeight(context) * 0.02),
                              alignment: Alignment.topLeft,
                              child: myUtills.textField(
                                  context,
                                  "PEUGEOT - LR01",
                                  Colors.white,
                                  FontWeight.bold,
                                  0.016,
                                  TextAlign.start)),
                          Gap(
                            myUtills.getHeight(context) * 0.02,
                          ),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  left: myUtills.getHeight(context) * 0.02,
                                  right: myUtills.getHeight(context) * 0.02
                              ),
                              alignment: Alignment.topLeft,
                              child: myUtills.textField(
                                  context,
                                  "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.",
                                  Colors.white,
                                  FontWeight.w300,
                                  0.018,
                                  TextAlign.start,
                                maxLines: 9
                              )),
                          Gap(
                            myUtills.getHeight(context) * 0.024,
                          ),
                          Container(
                            height: myUtills.getHeight(context) * 0.10,
                            width: double.infinity,

                            decoration: BoxDecoration(
                              color: myUtills.backgroundColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(myUtills.getHeight(context) * 0.04),
                                topRight: Radius.circular(myUtills.getHeight(context) * 0.04),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    child: myUtills.textField(context, '\$ ${1999.99}', Colors.white, FontWeight.bold, 0.020, TextAlign.center)),
                                TextButton(
                                    onPressed: () async {
                                      // signInWithGoogle();
                                    },
                                    child: Container(
                                        height: myUtills.getHeight(context) * 0.06,
                                        width: myUtills.getWidth(context) * 0.40,
                                        decoration: BoxDecoration(
                                            color: myUtills.buttonBackGround,
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Center(
                                            child: myUtills.textField(
                                                context,
                                                "Add to Cart",
                                                Colors.white,
                                                FontWeight.bold,
                                                0.016,
                                                TextAlign.center)))),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      // bottomNavigationBar: Material(
      //   elevation: 0, // Set elevation to 0 to remove shadow
      //   color: myUtills.backgroundColor,
      //   child: Container(
      //     height: myUtills.getHeight(context) * 0.10,
      //     decoration: BoxDecoration(
      //       color: myUtills.sliderDesignColor,
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(myUtills.getHeight(context) * 0.04),
      //         topRight: Radius.circular(myUtills.getHeight(context) * 0.04),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
