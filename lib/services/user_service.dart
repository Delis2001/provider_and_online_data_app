// ignore_for_file: unused_local_variable, empty_catches

import 'package:provider_and_online_data_app/models/api_result.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<ApiResult> fetchUsers() async {
    String url = 'https://testapi.thepivot.ng/api/test-feed/users';
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return ApiResult(
            success: true,
            message: 'fetching users is successful',
            response: response);
      } else {
        return ApiResult(
            success: false, message: 'Check your internet connection');
      }
    } catch (e) {
      print('Error $e');
      return ApiResult(success: false, message: 'Error occurd while fetching users');
    }
  }
}
