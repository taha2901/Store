// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// class Api {
//   Future<dynamic> get({required String url,@required dynamic body, @required String? token}) async {
//     Map<String, String> headers = {};

//     if (token != null) {
//       headers.addAll({'Authorization': 'Bearer $token'});
//     }
//     print('url = $url body = $body  token = $token');
//     http.Response response = await http.get(Uri.parse(url), headers: headers);

//     if (response.statusCode == 200) {
//       List<dynamic> data =  jsonDecode(response.body);
//       print(data);
//       return data;
//     } else {
//       throw Exception(
//           'there is a problem with status code ${response.statusCode}');
//     }
//   }

//   Future<dynamic> post(
//       {required String url,
//       @required dynamic body,
//       @required String? token}) async {
//     Map<String, String> headers = {};

//     if (token != null) {
//       headers.addAll({'Authorization': 'Bearer $token'});
//     }
//     http.Response response =
//         await http.post(Uri.parse(url), body: body, headers: headers);
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);

//       return data;
//     } else {
//       throw Exception(
//           'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
//     }
//   }

//   Future<dynamic> put(
//       {required String url,
//       @required dynamic body,
//       @required String? token}) async {
//     Map<String, String> headers = {};
//     headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
//     if (token != null) {
//       headers.addAll({'Authorization': 'Bearer $token'});
//     }

//     print('url = $url body = $body token = $token ');
//     http.Response response =
//         await http.put(Uri.parse(url), body: body, headers: headers);
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       print(data);
//       return data;
//     } else {
//       throw Exception(
//           'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
//     }
//   }
// }





import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final Dio _dio = Dio();

  Future<dynamic> get({required String url, @required String? token}) async {
    try {
      Response response = await _dio.get(url, options: _getOptions(token));
      return response.data;
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to get data');
    }
  }

  Future<dynamic> post(
      {required String url, @required dynamic body, @required String? token}) async {
    try {
      Response response = await _dio.post(url, data: body, options: _getOptions(token));
      return response.data;
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to post data');
    }
  }

  Future<dynamic> put(
      {required String url, @required dynamic body, @required String? token}) async {
    try {
      Response response = await _dio.put(url, data: body, options: _getOptions(token));
      return response.data;
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to put data');
    }
  }

  Options _getOptions(String? token) {
    Map<String, String> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    headers['Content-Type'] = 'application/json';
    return Options(headers: headers);
  }
}
