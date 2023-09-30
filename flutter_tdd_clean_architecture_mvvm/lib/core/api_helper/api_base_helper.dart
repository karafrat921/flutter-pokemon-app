import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

class ApiBaseHelper {
  http.Client client;

  ApiBaseHelper({required this.client});

  Future<dynamic> get({required String url, Map<String, String>? header}) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: header).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw TimeOutException('ConnectionTimeOut');
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    }

    return responseJson;
  }

  Future<dynamic> delete({
    required String url,
    required Map<String, String>? header,
    required Object? body,
  }) async {
    dynamic responseJson;
    try {
      final response = await http
          .delete(
        Uri.parse(url),
        body: body,
        headers: header,
      )
          .timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw TimeOutException('ConnectionTimeOut');
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    }

    return responseJson;
  }

  Future<dynamic> post({
    required String url,
    required Object? body,
    Map<String, String>? header,
  }) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: body,
            headers: header,
          )
          .timeout(
            const Duration(seconds: 15),
          );
      responseJson = _returnResponse(response);
    } on TimeoutException catch (_) {
      throw FetchDataException("");
    } on SocketException catch (_) {
      throw FetchDataException("");
    }

    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = _convertToJson(response.bodyBytes);
        return responseJson;

      case 401:
        throw UnauthorisedException(_convertToJson(response.bodyBytes)["message"]);
      default:
        throw BadRequestException(_convertToJson(response.bodyBytes)["message"]);
    }
  }

  dynamic _convertToJson(Uint8List bodyBytes) {
    var responseBody = utf8.decode(bodyBytes);
    return json.decode(responseBody);
  }
}
