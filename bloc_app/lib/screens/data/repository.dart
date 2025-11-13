// repository.dart
import 'dart:convert';

import '../model/model.dart';
import 'datasource.dart';

class CatRepository {
  final CatDataSource _dataSource;

  CatRepository(this._dataSource);

  Future<Model> getCatBreeds() async {
    try{
      final rawList = await _dataSource.fetchCatBreeds();
      print(rawList);// raw List<dynamic>
      return Model.fromJson(rawList);
    } catch(e){
      print(e);
      return Model();
    }
  }
}