import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../helper/api_contants.dart';
import '../helper/dialog_helper.dart';
import 'app_exceptions.dart';
import 'base_error_response.dart';

class BaseClient {

  //POST Request
  Future<dynamic> postDataOnServer(String serverApiUrl, dynamic payloadObj) async {
    var uri = Uri.parse(serverApiUrl);
    if (kDebugMode) {
      print('Url : $serverApiUrl');
      print('Token : $authBarerToken');
      print('Data : ${payloadObj.toString()}');
    }
    try {
      http.Response response = await http.post(Uri.parse(serverApiUrl),
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            'Accept': 'application/json',
            'Authorization': 'Bearer $authBarerToken',
          },
          encoding: Encoding.getByName('utf-8'),
          body: payloadObj);
      return _processResponse(response);
    } on WebSocketException {
      throw FetchDataException(
          [ServerErrors(code: 'WebSocketException', message: 'No Internet connection')], uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          [ServerErrors(code: 'TimeoutException', message: 'API not responded in time')], uri.toString());
    } on Exception catch (e) {
      debugPrint('Exception : ${e.toString()}');
    }
  }


  dynamic _processResponse(http.Response response) {
    if (kDebugMode) {
      print(response.body);
      print(response.statusCode);
    }
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
      case 401:
        BaseErrorResponse errorResponse =
        baseErrorResponseFromJson(response.body);
        DialogHelper.showErrorDialog(
            errorList: errorResponse.errors ?? [],
            responseCode: 401,
            title: "Server Error",
            url: response.request!.url.toString());
        break;
      case 422:
        BaseErrorResponse errorResponse =
        baseErrorResponseFromJson(response.body);
        DialogHelper.showErrorDialog(
            errorList: errorResponse.errors ?? [],
            responseCode: 422,
            title: "Server Error",
            url: response.request!.url.toString());
        break;
      case 503:
        BaseErrorResponse errorResponse =
        baseErrorResponseFromJson(response.body);
        DialogHelper.showErrorDialog(
            errorList: errorResponse.errors ?? [],
            responseCode: 503,
            title: "Server Error",
            url: response.request!.url.toString());
        break;
      case 500:
      default:
        BaseErrorResponse errorResponse =
        baseErrorResponseFromJson(response.body);
        DialogHelper.showErrorDialog(
            errorList: errorResponse.errors ?? [],
            responseCode: 500,
            title: "Server Error",
            url: response.request!.url.toString());
        break;
    }
  }

}