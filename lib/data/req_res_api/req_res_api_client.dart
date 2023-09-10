import 'dart:convert';
import 'dart:io';

import 'package:bloc_api_call_demo/utils/api_exceptions.dart';
import 'package:bloc_api_call_demo/utils/api_urls.dart';
import 'package:http/http.dart' as http;

class ReqResApiClient {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse("${ApiUrls.baseUrl}$url"));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print("responseJson: $responseJson");
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
