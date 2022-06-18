import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protype_project/data/drug.dart';

class CartController extends GetxController {
  var _product = {}.obs;

  void addProdcuts(DrugList drugProducts) {
    if (_product.containsKey(drugProducts)) {
      _product[drugProducts] + 1;
    } else {
      _product[drugProducts] = 1;
    }
    Get.snackbar(
      'Product Added',
      'You have added ${drugProducts.title} to the cart',
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.startToEnd,
      duration: const Duration(seconds: 2)
    );
  }
}
