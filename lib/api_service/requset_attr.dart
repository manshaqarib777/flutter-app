
import '../enums/requestTypes.dart';

class RequestAttr {
  String _url;
  bool _isDialogRequired = true;
  Map<String, Object> _headers = {};
  Map<String, Object> _queryParams = {};
  Map<String, Object> _pathParams = {};
  Map<String, dynamic> _body = {};
  HttpMethod _requestType;

  RequestAttr.withParamsAndBody(this._url, this._requestType,this._body,[this._headers=const {},this._queryParams=const {},this._pathParams=const {}]);

  RequestAttr.withHeaderAndParams(this._url,this._requestType,[this._headers=const {},this._queryParams=const {},this._pathParams=const {}]);


  @override
  String toString() {
    return 'RequestAttr{_url: $_url, _isDialogRequired: $_isDialogRequired, _headers: $_headers, _queryParams: $_queryParams, _pathParams: $_pathParams, _body: $_body, _requestType: $_requestType}';
  }

  HttpMethod get requestType => _requestType;

  Map<String, dynamic> get body => _body;

  Map<String, Object> get pathParams => _pathParams;

  Map<String, Object> get queryParams => _queryParams;

  Map<String, Object> get headers => _headers;

  bool get isDialogRequired => _isDialogRequired;

  String get url => _url;
}
