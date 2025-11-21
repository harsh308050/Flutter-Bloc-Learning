import 'dart:developer';
import '../../http/http_helper.dart';
import '../../utils/APIConstant.dart';

class DataSource {
  final String baseUrl = APIConstant.baseUrl;

  Future<dynamic> loginUser({
    required String username,
    required String password,
  }) async {
    Map<String, dynamic> params = {"username": username, "password": password};
    final response = await postMethod(
      endpoint: APIConstant.login,
      body: params,
    );
    log('Login response: $response');
    return response;
  }

  Future<dynamic> getUserDetails() async {
    final response = await getMethod(endpoint: APIConstant.user);
    log('Login response: $response');
    return response;
  }

  Future<dynamic> editUserDetails(
    String id,
    Map<String, dynamic> params,
  ) async {
    final response = await patchMethod(
      endpoint: "${APIConstant.allusers}/$id",
      body: params,
    );
    log('Edit Profile response: $response');
    return response;
  }

  Future<dynamic> getAllUsers() async {
    final response = await getMethod(endpoint: APIConstant.allusers);
    log('Login response: $response');
    return response;
  }

  Future<dynamic> getAllUsersDetailsData(num id) async {
    final response = await getMethod(endpoint: "${APIConstant.allusers}/$id");
    log('Login response: $response');
    return response;
  }
}
