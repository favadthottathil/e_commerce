import 'package:e/data/dummy_data.dart';
import 'package:e/model/data_model.dart';

class ProductData {
  getAllData() {
    return fashionProducts
        .map((item) => ProductDataModel.fromjson(
              item,
            ))
        .toList();
  }
}
