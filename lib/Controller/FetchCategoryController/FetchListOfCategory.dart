


import 'dart:convert';
import 'dart:developer';

import 'package:blogpractice/myUills.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../Model/fetchCategoryModel/fetchCategory.dart';

class FetchListOfCategory extends GetxController {
  RxBool isFetingCat = false.obs;
  RxList<FetchCategoryModel> cateoryList = <FetchCategoryModel>[].obs;


  Future<void> fetchCategory() async {
    try {
      isFetingCat.value = true;
      final response = await http.get(
        Uri.parse('${myUtills.endpoint}/categories'),
      );

      if (response.statusCode == 200) {
    final fetchCategoryModel = fetchCategoryModelFromJson(response.body);
        cateoryList.value = fetchCategoryModel;
      }
    } catch (e) {
      log("fetchCategory + $e");
    } finally {
      isFetingCat.value = false;
    }
  }
}

