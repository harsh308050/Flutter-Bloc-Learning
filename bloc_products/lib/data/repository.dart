import 'package:bloc_products/model/model.dart';

import 'datasrc.dart';

class Repository {
  final DataSource dataSource;
  Repository(this.dataSource);
  Future<dynamic> getData() async {
    try {
      var products = await dataSource.fetchData();
      print(products);
      return ProductsModel.fromJson(products);
    } catch (e) {
      print(e.toString());
      throw Exception('${e.toString()}');
    }
  }

  Future<dynamic> getProductData(num id) async {
    try {
      var product = await dataSource.fetchProductData(id);
      print(product);
      return ProductsModel(products: [Products.fromJson(product)]);
    } catch (e) {
      print(e.toString());
      throw Exception('${e.toString()}');
    }
  }
}
