import 'package:dio/dio.dart';
import 'package:gs_app/api_service/server_response.dart';

class ApiUtils {
  static bool isHeaderRequired = false;

  static ServerResponse parseServerResponse(Response response) {
    return ServerResponse(
        response.data.toString().isEmpty ? "{}" : response.data.toString(),
        false,
        "",
        "",
        response.statusCode!);
  }

  static void parseError(ServerResponse responseModel, Response response) {
    Map<String, dynamic> errorResponse = response.data;
    String errCode = errorResponse.containsKey("errorCode")
        ? errorResponse["errorCode"]
        : "";
    responseModel
        .setErrorMsg(/*getTranslated(context, responseModel.errorCode);*/
            errCode);
    responseModel.setErrorCode(errCode);
    responseModel.setResponse(response.data.toString());
  }
}
