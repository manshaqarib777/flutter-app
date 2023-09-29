import 'package:dio/dio.dart';
import 'package:gs_app/api_service/server_response.dart';

import 'api_utils.dart';

class DioExceptions {
  static String errorMsg = "";
  static int statusCode = -1;

  static ServerResponse responseModel = ServerResponse("", true, "", errorMsg, statusCode);

  static ServerResponse parseError(DioError dioError) {
    statusCode = dioError.response?.statusCode ?? -1;
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMsg = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorMsg = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        errorMsg = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        _handleError(
          dioError.response,
        );
        break;
      case DioErrorType.sendTimeout:
        errorMsg = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          errorMsg = 'No Internet';
          break;
        }
        errorMsg = "Unexpected error occurred";
        break;
      default:
        errorMsg = "Something went wrong";
        break;
    }

    return responseModel;
  }

  static void _handleError(dynamic error) {
    switch (statusCode) {
      case 400:
        {
          ApiUtils.parseError(responseModel, error);
        }
        break;
      case 401:
        {
          responseModel.setResponse("Unauthorized");
        }
        break;
      case 403:
        {
          responseModel.setResponse("Forbidden");
        }
        break;
      case 404:
        {
          responseModel.setResponse(error['message']);
        }
        break;
      case 500:
        {
          responseModel.setResponse("Internal server error");
        }
        break;
      case 502:
        {
          responseModel.setResponse("Bad gateway");
        }
        break;
      default:
        {
          responseModel.setResponse("Oops something went wrong");
        }
    }
  }
}
