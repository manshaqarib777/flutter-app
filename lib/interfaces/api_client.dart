

import '../api_service/requset_attr.dart';
import '../api_service/server_response.dart';

abstract class ApiClient {
  Future<ServerResponse> request(RequestAttr requestAttr);
}