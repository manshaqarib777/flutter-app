import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gs_app/api_service/requset_attr.dart';
import 'package:gs_app/api_service/server_response.dart';

import '../dialogs/custom_loading.dart';
import 'api_utils.dart';
class DioInterceptor extends Interceptor {
  late RequestAttr requestAttr;

  DioInterceptor(this.requestAttr);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    SmartDialog.showLoading(
        msg: "please wait...",
        builder: (_) => const CustomLoading(
              type: 2,
            ));

    // refresh token if expired
    if (ApiUtils.isHeaderRequired) {
      // options.headers['Authorization'] = 'Bearer $API_KEY';
    }

    print("request_data =>> TYPE: ${options.method}\n" + requestAttr.toString());
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    SmartDialog.dismiss();
    print("Response_SUCCESS =>> ${response.data.toString()}");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    SmartDialog.dismiss();
    ServerResponse response = ServerResponse.init();
    ApiUtils.parseError(response, err.response as dynamic);
    print("Response_ERROR =>> " + response.toString());

    return super.onError(err, handler);
  }
}
