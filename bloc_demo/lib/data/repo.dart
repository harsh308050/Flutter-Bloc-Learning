import 'package:bloc_strcture/model/model.dart';

import 'datasrc.dart';

class Repo {
  final DataSource dataSource;
  Repo(this.dataSource);
  Future<dynamic> fetchUsers() async {
    try {
      final users = await dataSource.getUsers();
      print(users);
      return UserModel.fromJson(users);
    } catch (e) {
      print(e);
    }
  }
}
