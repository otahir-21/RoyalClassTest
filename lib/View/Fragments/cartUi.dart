import 'package:flutter/material.dart';

import '../../myUills.dart';

class CartUi extends StatefulWidget {
  const CartUi({super.key});

  @override
  State<CartUi> createState() => _CartUiState();
}

class _CartUiState extends State<CartUi> {


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
                myUtills.textField(context, "No item in Cart", Colors.white, FontWeight.bold, 0.014, TextAlign.center)
              ],
            )));
  }

}
