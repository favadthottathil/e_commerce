import 'package:e/model/data_model.dart';
import 'package:flutter/material.dart';

class CartContrller extends ChangeNotifier {
  Map<ProductDataModel, int> cartData = {};

  List<ProductDataModel> cartList = [];

  set addCartList(ProductDataModel productDataModel) {
    if (!cartList.contains(productDataModel)) {
      cartList.add(productDataModel);
    }

    notifyListeners();
  }

  addToCart(ProductDataModel productDataModel) {
    if (!cartData.containsKey(productDataModel)) {
      cartData[productDataModel] = 1;
    } else {
      cartData[productDataModel] = (cartData[productDataModel] ?? 0) + 1;
    }

    notifyListeners();
  }

  removeToCart(ProductDataModel productDataModel) {
    if (!cartData.containsKey(productDataModel)) {
      cartData[productDataModel] = 1;
    } else {
      if (cartData[productDataModel]! > 0) {
        cartData[productDataModel] = (cartData[productDataModel] ?? 0) - 1;
      }
    }

    notifyListeners();
  }
}
