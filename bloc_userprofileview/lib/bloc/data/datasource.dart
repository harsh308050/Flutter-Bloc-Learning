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
}
