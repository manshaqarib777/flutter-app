class ServerResponse {
  String _response = "";
  bool _isError = false;
  String _errorCode = "";
  String _errorMsg = "";
  int _statusCode = -1;

  ServerResponse(this._response, this._isError, this._errorCode, this._errorMsg, this._statusCode);

  ServerResponse.init() {
    _response = "";
    _isError = false;
    _errorCode = "";
    _errorMsg = "";
    _statusCode;
  }

  Map<String, dynamic> toMap() {
    return {
      '_response': _response,
      '_isError': _isError,
      '_errorCode': _errorCode,
      '_errorMsg': _errorMsg,
      '_statusCode': _statusCode,
    };
  }

  factory ServerResponse.fromMap(Map<String, dynamic> map) {
    return ServerResponse(
      map['_response'] as String,
      map['_isError'] as bool,
      map['_errorCode'] as String,
      map['_errorMsg'] as String,
      map['_statusCode'] as int,
    );
  }

  int get statusCode => _statusCode;

  ServerResponse setStatusCode(int value) {
    _statusCode = value;
    return this;
  }

  String get errorMsg => _errorMsg;

  ServerResponse setErrorMsg(String value) {
    _errorMsg = value;
    return this;
  }

  String get errorCode => _errorCode;

  ServerResponse setErrorCode(String value) {
    _errorCode = value;
    return this;
  }

  bool get isError => _isError;

  ServerResponse setIsError(bool value) {
    _isError = value;
    return this;
  }

  String get response => _response;

  ServerResponse setResponse(String value) {
    _response = value;
    return this;
  }

  @override
  String toString() {
    return "RESPONSE=" + _response + "\n" + ", ERROR_CODE=" + _errorCode.toString() + "\n" + ", ERROR_MSG=" + _errorMsg.toString() + "\n" + ", STATUS_CODE=" + _statusCode.toString() + "\n";
  }
}
