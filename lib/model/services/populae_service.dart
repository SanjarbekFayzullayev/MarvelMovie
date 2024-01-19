import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:muslimmovie/core/app_exception.dart';

import 'base_sevice.dart';

class PopularService extends BaseService {
  dynamic responseJson;

  @override
  Future getResponse(String url) async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("Internet error :( ");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 401:
        throw UnauthorizedException(response.statusCode.toString());
      case 400:
        throw NotFoundException(response.statusCode.toString());
      default:
        Exception(response.statusCode.toString());
    }
  }
}
