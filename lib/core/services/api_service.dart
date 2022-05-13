import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/core/services/store_service.dart';
import 'package:planetx/shared/models/api_model.dart';
import 'package:planetx/shared/models/auth_model.dart';
import 'package:planetx/shared/utils/config.dart';
import 'package:http/http.dart' as http;

class ApiService {
  const ApiService(this.storeService);

  final StoreService storeService;

  Future<Map<String, String>> httpHeaders(
      [Map<String, String> customHeaders]) async {
    final Map<String, String> h = customHeaders ?? <String, String>{};

    if (h[HttpHeaders.contentTypeHeader] == null) {
      h[HttpHeaders.contentTypeHeader] = 'application/json; charset=UTF-8';
    }

    final AuthPayload auth = await si.authService.getAuthData();

    if (auth != null && auth.token.isNotEmpty) {
      // print(auth.token);

      h[HttpHeaders.authorizationHeader] = 'Bearer ${auth.token}';
    }

    return h;
  }

  dynamic _jsonEncodeDateHandler(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }

    return item;
  }

  String httpBody(dynamic body) {
    return jsonEncode(body, toEncodable: _jsonEncodeDateHandler);
  }

  String _toId(String text) {
    return text;
  }

  Stream<ApiResponse<T>> getApiStoreData<T>(
    String url, {
    T Function(dynamic) transform,
    bool skipStatusCheck = false,
    Map<String, String> params,
  }) {
    transform ??= (dynamic r) => r.body as T;
    params ??= <String, String>{};

    final Uri uri = AppConfig.apiProtocol.startsWith('https')
        ? Uri.https(AppConfig.apiDomain, AppConfig.apiPath(url), params)
        : Uri.http(AppConfig.apiDomain, AppConfig.apiPath(url), params);

    return storeService
        .getApiData(
          id: _toId(uri.toString()),
          uri: uri,
          headers: httpHeaders(),
          transform: (dynamic data, [String errMsg]) {
            final ApiResponse<T> res = ApiResponse<T>();
            // print('URL___$uri');
            // print('res---$res');
            if (errMsg != null) {
              res.success = false;
              res.message = errMsg;
            } else {
              res.data = transform(data);
            }

            return res;
          },
        )
        .map((ApiResponse<T> event) => event);
  }

  Future<ApiResponse<T>> getApi<T>(
    String url, {
    T Function(dynamic) transform,
    bool skipStatusCheck = false,
    Map<String, String> params,
  }) async {
    transform ??= (dynamic r) => r.body as T;
    params ??= <String, String>{};

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      final Map<String, String> headers = await httpHeaders();
      final Uri uri = AppConfig.apiProtocol.startsWith('https')
          ? Uri.https(AppConfig.apiDomain, AppConfig.apiPath(url), params)
          : Uri.http(AppConfig.apiDomain, AppConfig.apiPath(url), params);

      // print("URI__ $uri");
      // print("Header for Get__ $headers");

      final http.Response res = await http
          .get(
            uri,
            headers: headers,
          )
          .timeout(const Duration(seconds: 30));

      print("RES ${res.statusCode}");
      print('get body' + res.body);
      final dynamic data = json.decode(res.body ?? '');
      print("data $data");

      /// This is applicable when server sends unique error codes.
      // if (skipStatusCheck || res.statusCode == 200 || res.statusCode == 201) {
      //   apiResponse.data = transform(data);
      // } else {
      //   // print('Api error at $uri and $data');
      //
      //   apiResponse.error = true;
      //   apiResponse.message =
      //       (data['message'] ?? 'Error encountered').toString();
      // }

      if ((data != null && data['success'] == false)) {
        apiResponse.success = true;
        apiResponse.message =
            (data['message'] ?? 'Error encountered').toString();
        apiResponse.data = transform(data);
      } else {
        apiResponse.success = false;
        apiResponse.data = transform(data);
        apiResponse.message =
            (data['message'] ?? 'Error encountered').toString();
      }
    } on TimeoutException catch (e) {
      apiResponse.success = false;
      debugPrint(e.toString());
      apiResponse.message =
          ('Network Error. The operation couldnt be completed. Check your internet settings')
              .toString();
    } catch (e) {
      apiResponse.success = false;
      apiResponse.message =
          ('Network Error. The operation couldnt be completed.' ??
                  'Error encountered')
              .toString();
      debugPrint(e.toString());
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> postApiAdd<T>(
    String url,
    dynamic body, {
    T Function(dynamic) transform,
    bool skipStatusCheck = false,
    Map<String, String> customHeaders,
    Map<String, String> params,
  }) async {
    transform ??= (dynamic r) => r.body as T;

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      final Map<String, String> headers = await httpHeaders(customHeaders);
      final Uri uri = AppConfig.apiProtocol.startsWith('https')
          ? Uri.https(AppConfig.apiDomain, AppConfig.apiPath(url), params)
          : Uri.http(AppConfig.apiDomain, AppConfig.apiPath(url), params);

      final http.Response res = await http.post(
        uri,
        headers: headers,
        body: httpBody(body),
      );
      // print('URL___ $uri');
      // print('body___ ${httpBody(body)}');

      final dynamic data = json.decode(res.body);
      // print('ResponesData---- $data');
      if (skipStatusCheck || res.statusCode == 200 || res.statusCode == 201) {
        apiResponse.data = transform(data);
      } else {
        //apiResponse.error = true;
        apiResponse.data = transform(data);
        apiResponse.message =
            (data['message'] ?? 'Error encountered').toString();
      }
    } catch (e) {
      debugPrint(e.toString());
      apiResponse.success = false;
      apiResponse.message = (e ?? 'Error encountered').toString();
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> postApi<T>(
    String url,
    dynamic body, {
    T Function(dynamic) transform,
    bool skipStatusCheck = false,
    Map<String, String> customHeaders,
    Map<String, String> params,
  }) async {
    transform ??= (dynamic r) => r.body as T;

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      final Map<String, String> headers = await httpHeaders(customHeaders);
      final Uri uri = AppConfig.apiProtocol.startsWith('https')
          ? Uri.https(AppConfig.apiDomain, AppConfig.apiPath(url), params)
          : Uri.http(AppConfig.apiDomain, AppConfig.apiPath(url), params);

      final http.Response res = await http.post(
        uri,
        headers: headers,
        body: httpBody(body),
      );
      // print('URL___ $uri');
      // print('body___ ${httpBody(body)}');

      final dynamic data = json.decode(res.body);
      // print('ResponesData----data');
      if (skipStatusCheck || res.statusCode == 200 || res.statusCode == 201) {
        apiResponse.data = transform(data);
      } else {
        apiResponse.success = false;
        // apiResponse.data = transform(data);
        apiResponse.message =
            (data['message'] ?? 'Error encountered').toString();
      }
    } catch (e) {
      debugPrint(e.toString());
      apiResponse.success = false;
      apiResponse.message = (e ?? 'Error encountered').toString();
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> putApiDynamic<T>(
    String url,
    dynamic body, {
    T Function(dynamic) transform,
    bool skipStatusCheck = false,
    Map<String, dynamic> params,
  }) async {
    transform ??= (dynamic r) => r.body as T;

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      final Map<String, String> headers = await httpHeaders();
      final Uri uri = AppConfig.apiProtocol.startsWith('https')
          ? Uri.https(AppConfig.apiDomain, AppConfig.apiPath(url), params)
          : Uri.http(AppConfig.apiDomain, AppConfig.apiPath(url), params);

      final http.Response res = await http.put(
        uri,
        headers: headers,
        body: httpBody(body),
      );

      final dynamic data = json.decode(res.body);

      // print(uri);
      // print(headers);

      if (skipStatusCheck || res.statusCode == 200 || res.statusCode == 201) {
        apiResponse.data = transform(data);
      } else {
        // print('data--$data');
        apiResponse.success = false;
        apiResponse.message =
            (data['message'] ?? 'Error encountered').toString();
      }
    } catch (e) {
      debugPrint(e.toString());

      apiResponse.success = false;
      apiResponse.message = (e ?? 'Error encountered').toString();
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> putApi<T>(
    String url,
    dynamic body, {
    T Function(dynamic) transform,
    bool skipStatusCheck = false,
    Map<String, String> params,
  }) async {
    transform ??= (dynamic r) => r.body as T;

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      final Map<String, String> headers = await httpHeaders();
      final Uri uri = AppConfig.apiProtocol.startsWith('https')
          ? Uri.https(AppConfig.apiDomain, AppConfig.apiPath(url), params)
          : Uri.http(AppConfig.apiDomain, AppConfig.apiPath(url), params);

      final http.Response res = await http.put(
        uri,
        headers: headers,
        body: httpBody(body),
      );

      final dynamic data = json.decode(res.body);

      // print(uri);
      // print(headers);

      if (skipStatusCheck || res.statusCode == 200 || res.statusCode == 201) {
        apiResponse.data = transform(data);
      } else {
        // print('data--$data');
        apiResponse.success = false;
        apiResponse.message =
            (data['message'] ?? 'Error encountered').toString();
      }
    } catch (e) {
      debugPrint(e.toString());

      apiResponse.success = false;
      apiResponse.message = (e ?? 'Error encountered').toString();
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> putApiError<T>(
    String url,
    dynamic body, {
    T Function(dynamic) transform,
    bool skipStatusCheck = false,
    Map<String, String> params,
  }) async {
    transform ??= (dynamic r) => r.body as T;
    final ApiResponse<T> apiResponse = ApiResponse<T>();
    try {
      final Map<String, String> headers = await httpHeaders();
      final Uri uri = AppConfig.apiProtocol.startsWith('https')
          ? Uri.https(AppConfig.apiDomain, AppConfig.apiPath(url), params)
          : Uri.http(AppConfig.apiDomain, AppConfig.apiPath(url), params);
      final http.Response res = await http.put(
        uri,
        headers: headers,
        body: httpBody(body),
      );
      final dynamic data = json.decode(res.body);
      // print(headers);
      if (skipStatusCheck || res.statusCode == 200 || res.statusCode == 201) {
        apiResponse.data = transform(data);
      } else {
        // print('data--$data');

        apiResponse.data = transform(data);
        apiResponse.message =
            (data['message'] ?? 'Error encountered').toString();
      }
    } catch (e) {
      debugPrint(e.toString());
      // print('expction -- ${e.toString()}');
      apiResponse.success = false;
      apiResponse.message = (e ?? 'Error encountered').toString();
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> deleteApi<T>(
    String url, {
    T Function(dynamic) transform,
    bool skipStatusCheck = false,
    Map<String, String> params,
  }) async {
    transform ??= (dynamic r) => r.body as T;
    params ??= <String, String>{};

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      final Map<String, String> headers = await httpHeaders();
      final Uri uri = AppConfig.apiProtocol.startsWith('https')
          ? Uri.https(AppConfig.apiDomain, AppConfig.apiPath(url), params)
          : Uri.http(AppConfig.apiDomain, AppConfig.apiPath(url), params);

      final http.Response res = await http.delete(
        uri,
        headers: headers,
      );

      final dynamic data = json.decode(res.body ?? '');

      if (skipStatusCheck || res.statusCode == 200 || res.statusCode == 201) {
        apiResponse.data = transform(data);
      } else {
        // print('Api error at $uri and $data');

        apiResponse.success = false;
        apiResponse.message =
            (data['message'] ?? 'Error encountered').toString();
      }
    } catch (e) {
      debugPrint(e.toString());

      apiResponse.success = false;
      apiResponse.message = (e ?? 'Error encountered').toString();
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> getApiDynamic<T>(
    String url, {
    T Function(dynamic) transform,
    bool skipStatusCheck = false,
    Map<String, dynamic> params,
  }) async {
    transform ??= (dynamic r) => r.body as T;
    params ??= <String, dynamic>{};

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      final Map<String, String> headers = await httpHeaders();
      final Uri uri = AppConfig.apiProtocol.startsWith('https')
          ? Uri.https(AppConfig.apiDomain, AppConfig.apiPath(url), params)
          : Uri.http(AppConfig.apiDomain, AppConfig.apiPath(url), params);

      final http.Response res = await http.get(
        uri,
        headers: headers,
      );
      // print('URLsss____$uri');
      // print('Token____${headers.values}');
      final dynamic data = json.decode(res.body ?? '');

      if (skipStatusCheck || res.statusCode == 200 || res.statusCode == 201) {
        apiResponse.data = transform(data);
      } else {
        // print('Api error at $uri and $data');

        apiResponse.success = false;
        apiResponse.message =
            (data['message'] ?? 'Error encountered').toString();
      }
    } catch (e) {
      debugPrint(e.toString());

      apiResponse.success = false;
      apiResponse.message = (e ?? 'Error encountered').toString();
    }

    return apiResponse;
  }
}
