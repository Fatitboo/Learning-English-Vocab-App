import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../storage/storage.dart';
import '../storage/user_storage.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiService {
  String token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY)??"";
  final String baseUrl = "http://192.168.208.227:3000";
  @override
  Future<http.Response> getApi(String path) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + path), headers: {
        'content-type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      print(response.body);
      return response;
    } on SocketException {
      throw InternetException();
    }
  }

  @override
  Future<http.Response> postApi(String path, Object body) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(baseUrl + path),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: body);
      print(response.body);
      return response;
    } on SocketException {
      throw InternetException();
    }
  }

  @override
  Future<http.Response> putApi(String path, Object body) async {
    dynamic responseJson;
    try {
      final response = await http.put(Uri.parse(baseUrl + path),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: body);
      print(response.body);
      return response;
    } on SocketException {
      throw InternetException();
    }
  }
  Future<http.Response> patchApi(String path, Object body) async {
    dynamic responseJson;
    try {
      final response = await http.patch(Uri.parse(baseUrl + path),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: body);
      print(response.body);
      return response;
    } on SocketException {
      throw InternetException();
    }
  }

  @override
  Future<http.Response> deleteApi(String path) async {
    dynamic responseJson;
    try {
      final response = await http.delete(Uri.parse(baseUrl + path),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      print(response.body);
      return response;
    } on SocketException {
      throw InternetException();
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException();
    }
  }
}
class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, "No internet");
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, "Request Time Out");
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, "Internet Server error");
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, "Invalid Url");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, "Fetch Data error");
}