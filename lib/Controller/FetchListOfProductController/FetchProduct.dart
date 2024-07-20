


import 'dart:developer';

import 'package:blogpractice/myUills.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../Model/FetchProductModel/fetchProduct.dart';

class FetchProduct extends GetxController {
  RxBool isFetingProduct = false.obs;
  RxList<FetchProductModel> productList = <FetchProductModel>[].obs;


  Future<void> fetchProduct() async {
    try {
      isFetingProduct.value = true;
      final response = await http.get(
        Uri.parse('${myUtills.endpoint}/products'),
      );

      if (response.statusCode == 200) {
    final fetchProductModel = fetchProductModelFromJson(response.body);

    productList.value = fetchProductModel;
      }
    } catch (e) {
      log("fetchProduct + $e");
    } finally {
      isFetingProduct.value = false;
    }
  }
}

