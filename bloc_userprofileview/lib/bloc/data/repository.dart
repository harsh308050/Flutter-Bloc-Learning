import 'dart:convert';
import 'dart:developer';
import 'package:bloc_userprofileview/bloc/model/allUser_model.dart';
import 'package:bloc_userprofileview/bloc/model/user_model.dart';
import 'package:bloc_userprofileview/bloc/model/user_res_model.dart';
import 'package:http/http.dart';

import '../../http/apires.dart';
import 'datasource.dart';

class Repository {
  final DataSource dataSource;
  Repository(this.dataSource);

  Future<ApiResult<UserModel>> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      Response result = await dataSource.loginUser(
        username: username,
        password: password,
      );
      if (result.statusCode == 200 || result.statusCode == 201) {
        final data = UserModel.fromJson(jsonDecode(result.body));
        return ApiResult.success(data: data);
      } else {
        return ApiResult.failure(error: jsonDecode(result.body)['message']);
      }
    } catch (e) {
      return ApiResult.failure(error: "Something went wrong");
    }
  }

  Future<ApiResult<UserResModel>> getUserDetails() async {
    try {
      Response result = await dataSource.getUserDetails();
      if (result.statusCode == 200 || result.statusCode == 201) {
        final data = UserResModel.fromJson(jsonDecode(result.body));
        return ApiResult.success(data: data);
      } else {
        return ApiResult.failure(error: jsonDecode(result.body)['message']);
      }
    } catch (e) {
      return ApiResult.failure(error: "Something went wrong");
    }
  }

  Future<ApiResult<UserResModel>> editUserDetails({
    required String id,
    required Map<String, dynamic> params,
  }) async {
    try {
      Response result = await dataSource.editUserDetails(id, params);
      if (result.statusCode == 200 || result.statusCode == 201) {
        final data = UserResModel.fromJson(jsonDecode(result.body));
        return ApiResult.success(data: data);
      } else {
        return ApiResult.failure(error: jsonDecode(result.body)['message']);
      }
    } catch (e) {
      log("Something went wrong ${e.toString()}");
      return ApiResult.failure(error: "Something went wrong ${e.toString()}");
    }
  }

  Future<ApiResult<AllUsersModel>> getAllUsers() async {
    try {
      Response result = await dataSource.getAllUsers();
      if (result.statusCode == 200 || result.statusCode == 201) {
        final data = AllUsersModel.fromJson(jsonDecode(result.body));
        return ApiResult.success(data: data);
      } else {
        return ApiResult.failure(error: jsonDecode(result.body)['message']);
      }
    } catch (e) {
      log("Something went wrong============ ${e.toString()}");
      return ApiResult.failure(error: "Something went wrong");
    }
  }

  Future<ApiResult<AllUsersModel>> getAllUsersDetailsData(num id) async {
    try {
      Response result = await dataSource.getAllUsersDetailsData(id);
      if (result.statusCode == 200 || result.statusCode == 201) {
        final data = AllUsersModel(
          users: [Users.fromJson(jsonDecode(result.body))],
        );
        return ApiResult.success(data: data);
      } else {
        return ApiResult.failure(error: jsonDecode(result.body)['message']);
      }
    } catch (e) {
      log("Something went wrong============ ${e.toString()}");
      return ApiResult.failure(error: "Something went wrong");
    }
  }
}
