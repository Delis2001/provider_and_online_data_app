// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_print

import 'package:http/http.dart' as http;
import 'package:provider_and_online_data_app/models/api_result.dart';

class PostService {
  static Future<ApiResult> fetchPost() async {
    String url = 'https://testapi.thepivot.ng/api/test-feed/posts/test/36';
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return ApiResult(
            success: true, 
            message: 'fetching post is successful',
            response: response);
      } else {
        return ApiResult(success: false, message: 'Check your internet connection');
      }
    } catch (e) {
      print('Error $e');
      return ApiResult(success: false,message: 'Error occurred while fetching post');
    }
  }
  
}
