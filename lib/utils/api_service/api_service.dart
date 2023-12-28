import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:toobler_test/widgets/custom_snackbar.dart';

import '../constants/api_url.dart';
import '../constants/custom_print.dart';

class ApiService {
  Future<http.Response?> apiRequest({
    required String method,
    Map<String, dynamic>? body,
    bool withToken = false,
  }) async {
    

    final header = {'Content-Type': 'application/json'};

    try {
      String apiUrl = baseUrl;

      http.Response? response;

      switch (method) {
        case 'get':
          response = await http
              .get(
                  Uri.parse(
                    apiUrl,
                  ),
                  headers: header)
              .timeout(const Duration(seconds: 5));
          break;

        case 'post':
          response = await http
              .post(Uri.parse(apiUrl), body: body)
              .timeout(const Duration(seconds: 5));
          break;

        case 'put':
          response = await http
              .put(Uri.parse(apiUrl), body: body)
              .timeout(const Duration(seconds: 5));
          break;

        case 'delete':
          response = await http
              .delete(
                Uri.parse(apiUrl),
              )
              .timeout(const Duration(seconds: 5));
          break;
        default:
      }

      if (response?.statusCode == 200) {
        return response;
      } else {
        customLog('error status code is --${response?.statusCode}');
        customLog(response?.body ?? '');
        return response;
      }
    } on SocketException {
      CustomAlerts.customAlert('Internet not connected');
      customLog('no internet');
    } catch (e) {
      CustomAlerts.customAlert('error: $e');
      customLog('catch$e');
    }
    return null;
  }
}
