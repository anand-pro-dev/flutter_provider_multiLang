import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../functions/localStorage.dart';

class ApiServiceRepo {
  Future<dynamic> get({required baseUrl}) async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      log('Response data: ${response.body.toString()}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        log('Response data: $jsonData');
        return jsonData;
      } else {
        return {
          'status': false,
          '__': 'Error: ${response.statusCode}',
        };
      }
    } catch (e) {
      // Handle exceptions
      log('Exception: $e');
      return {
        'status': false,
        '__': e.toString(),
      };
    }
  }

  Future<dynamic> post({required baseUrl, required body}) async {
    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body));

      log('Response data: ${response.body.toString()}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // log('Response data: $jsonData');
        return jsonData;
      } else {
        final jsonData = json.decode(response.body);
        // Handle errors
        // log('Error: ${response.statusCode}');
        // throw ('Error: ${response.statusCode}');
        return jsonData;
        // return {
        //   'success': false,
        //   'message': 'Error: ${response.body}',
        // };
      }
    } catch (e) {
      // Handle exceptions
      log('Exception: $e');
      return {
        'success': false,
        'message': e.toString(),
      };
    }
  }

  // with token
  Future<dynamic> getWithToken({required baseUrl}) async {
    final token = await LocalStoreService.getAuthToken();
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // log('Response data: $jsonData');
        return jsonData;
      } else {
        // Handle errors
        // log('Error: ${response.statusCode}');
        // throw ('Error: ${response.statusCode}');
        return {
          'success': false,
          'message': 'Error: ${response.reasonPhrase}',
        };
      }
    } catch (e) {
      // Handle exceptions
      log('Exception: $e');
      return {
        'success': false,
        'message': e.toString(),
      };
    }
  }

  Future<dynamic> postToken({required baseUrl, required body}) async {
    final token = await LocalStoreService.getAuthToken();
    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(body));
      log(response.body.toString());
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        log('Response data: $jsonData');
        return jsonData;
      } else {
        // Handle errors
        // log('Error: ${response.statusCode}');
        // throw ('Error: ${response.statusCode}');
        return {
          'success': false,
          'message': 'Error: ${response.reasonPhrase}',
        };
      }
    } catch (e) {
      // Handle exceptions
      log('Exception: $e');
      return {
        'success': false,
        'message': e.toString(),
      };
    }
  }
}
