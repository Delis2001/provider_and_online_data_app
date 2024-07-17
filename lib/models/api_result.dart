
// ignore_for_file: unused_import

import 'package:http/http.dart' as http;
class ApiResult {
  bool success = false;
  String? message;
  http. Response? response;
  ApiResult({
    required this.success,
    this.message,
    this.response,
  });
  
}
