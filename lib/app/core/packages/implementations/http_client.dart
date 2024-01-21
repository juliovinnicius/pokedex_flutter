import 'dart:convert';

import 'package:http/http.dart' as http;

import '../abstractions/http_client_exception.dart';
import '../abstractions/http_response.dart';
import '../abstractions/i_http_client.dart';

class HttpClient implements IHttpClient {
  final http.Client _httpClient;
  final bool automaticallyEncodeRequestBody;
  final bool automaticallyDecodeResponseBody;
  final bool useApplicationJsonAsDefaultContentType;

  const HttpClient(
    this._httpClient, {
    this.automaticallyEncodeRequestBody = false,
    this.automaticallyDecodeResponseBody = false,
    this.useApplicationJsonAsDefaultContentType = true,
  });

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    try {
      if (useApplicationJsonAsDefaultContentType) {
        headers = {
          ...{'Content-Type': 'application/json'},
          ...?headers,
        };
      }

      final response = await _httpClient.get(
        Uri.parse(url),
        headers: headers,
      );

      final responseBody = automaticallyDecodeResponseBody
          ? json.decode(response.body)
          : response.body;

      return HttpResponse(
        data: responseBody,
        dataInBytes: response.bodyBytes,
        statusCode: response.statusCode,
      );
    } catch (exception) {
      throw HttpClientException(
        error: exception,
        description: exception.toString(),
      );
    }
  }

  @override
  Future<HttpResponse> post(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      if (useApplicationJsonAsDefaultContentType) {
        headers = {
          ...{'Content-Type': 'application/json'},
          ...?headers,
        };
      }

      final requestBody = body != null && automaticallyEncodeRequestBody
          ? json.encode(body)
          : body;

      final response = await _httpClient.post(
        Uri.parse(url),
        headers: headers,
        body: requestBody,
      );

      final responseBody = automaticallyDecodeResponseBody
          ? json.decode(response.body)
          : response.body;

      return HttpResponse(
        data: responseBody,
        dataInBytes: response.bodyBytes,
        statusCode: response.statusCode,
      );
    } catch (exception) {
      throw HttpClientException(
        error: exception,
        description: exception.toString(),
      );
    }
  }

  @override
  Future<HttpResponse> put(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      if (useApplicationJsonAsDefaultContentType) {
        headers = {
          ...{'Content-Type': 'application/json'},
          ...?headers,
        };
      }

      final requestBody = body != null && automaticallyEncodeRequestBody
          ? json.encode(body)
          : body;

      final response = await _httpClient.put(
        Uri.parse(url),
        headers: headers,
        body: requestBody,
      );

      final responseBody = automaticallyDecodeResponseBody
          ? json.decode(response.body)
          : response.body;

      return HttpResponse(
        data: responseBody,
        dataInBytes: response.bodyBytes,
        statusCode: response.statusCode,
      );
    } catch (exception) {
      throw HttpClientException(
        error: exception,
        description: exception.toString(),
      );
    }
  }

  @override
  Future<HttpResponse> delete(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      if (useApplicationJsonAsDefaultContentType) {
        headers = {
          ...{'Content-Type': 'application/json'},
          ...?headers,
        };
      }

      final requestBody = body != null && automaticallyEncodeRequestBody
          ? json.encode(body)
          : body;

      final response = await _httpClient.delete(
        Uri.parse(url),
        headers: headers,
        body: requestBody,
      );

      final responseBody = automaticallyDecodeResponseBody
          ? json.decode(response.body)
          : response.body;

      return HttpResponse(
        data: responseBody,
        dataInBytes: response.bodyBytes,
        statusCode: response.statusCode,
      );
    } catch (exception) {
      throw HttpClientException(
        error: exception,
        description: exception.toString(),
      );
    }
  }
}
