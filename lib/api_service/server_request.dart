import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:gs_app/api_service/requset_attr.dart';
import 'package:gs_app/api_service/server_response.dart';
import 'package:gs_app/interfaces/api_client.dart';
import 'api_utils.dart';
import 'dia_exceptions.dart';
import 'dio_interceptor.dart';

class ServerRequest extends ApiClient{
  @override
   Future<ServerResponse> request(RequestAttr requestAttr) async {
    _initRequest(requestAttr);
    try {
      final response = await _requestDio.request(
        requestAttr.url,
        options: Options(
          method: requestAttr.requestType.name,
          headers: requestAttr.headers,
        ),
        queryParameters: requestAttr.queryParams,
        data: requestAttr.body,
      );
      return ApiUtils.parseServerResponse(response);

    } on DioError catch (e) {
      return DioExceptions.parseError(e);
    }
  }

  static late Dio _requestDio;
  static late BaseOptions _baseOptions;

  static void _initRequest(RequestAttr attr) {
    _baseOptions = BaseOptions(baseUrl: attr.url, connectTimeout: 15000, receiveTimeout: 3000);
    _baseOptions.contentType = Headers.jsonContentType;

    if (attr.headers.isNotEmpty) {
      _baseOptions.headers.addAll(attr.headers);
    }

    if (attr.queryParams.isNotEmpty) {
      _baseOptions.queryParameters.addAll(attr.queryParams);
    }

    _requestDio = Dio(_baseOptions);
    _requestDio.interceptors.add(DioInterceptor(attr));

    (_requestDio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}
