import "package:http/http.dart" as http;

class CustomHttpClient {
  final String _baseUrl = "http://localhost:3000/api/v1";
  String? _token;
  final http.Client _client = http.Client();

  void setAuthtoken(String token) {
    _token = token;
  }

  _getHeaders(Map<String, String>? headers) {
    return {
      ...headers ?? {},
      "Content-Type": "application/json",
      if (_token != null) "Authroization": "Bearer $_token",
    };
  }

  Future<http.Response> get(String url, {Map<String, String>? headers}) {
    return _client.get(Uri.parse(_baseUrl + url),
        headers: _getHeaders(headers));
  }

  Future<http.Response> post(String url, Object body,
      {Map<String, String>? headers}) {
    return _client.post(Uri.parse(_baseUrl + url),
        headers: _getHeaders(headers), body: body);
  }

  Future<http.Response> put(String url, Object body,
      {Map<String, String>? headers}) {
    return _client.put(Uri.parse(_baseUrl + url),
        headers: _getHeaders(headers), body: body);
  }

  Future<http.Response> patch(String url, Object body,
      {Map<String, String>? headers}) {
    return _client.patch(Uri.parse(_baseUrl + url),
        headers: _getHeaders(headers), body: body);
  }

  Future<http.Response> delete(String url, {Map<String, String>? headers}) {
    return _client.delete(Uri.parse(_baseUrl + url),
        headers: _getHeaders(headers));
  }
}
