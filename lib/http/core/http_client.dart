import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../utils/log_service.dart';
import 'i_http_client.dart';

@Injectable(as: BaseHttpClient, env: [Environment.dev])
class MHttpClient extends _HttpClient {
  MHttpClient()
      : super(
          Dio(BaseOptions(
              baseUrl: 'baseURL',
              connectTimeout: 20000,
              receiveTimeout: 20000,
              headers: {
                "content-type": "application/json",
              })),
        );
}

class _HttpClient implements BaseHttpClient {
  final Dio _dio;
  //final Storage _storage = Storage();

  @override
  String? accessToken;
  bool _showLog = true;
  bool canRefresh = true;

  _HttpClient(this._dio) {
    _setInterceptors();
  }

  @override
  void showLog(bool show) => _showLog = show;

  @override
  Future get({
    required query,
    Map<String, dynamic>? queryParameters,
    bool useBaseUrl = true,
  }) async {
    return await _sendRequest(_dio.get(
      query,
      queryParameters: queryParameters,
    ));
  }

  @override
  Future post({
    required query,
    Map<String, dynamic>? data,
    bool useBaseUrl = true,
  }) async {
    return await _sendRequest(
      _dio.post(query, data: data),
    );
  }

  @override
  Future put({
    required query,
    Map<String, dynamic>? data,
  }) async {
    return await _sendRequest(
      _dio.put(query, data: data),
    );
  }

  @override
  Future delete({
    required query,
    Map<String, dynamic>? data,
    bool useBaseUrl = false,
  }) async {
    return await _sendRequest(
      _dio.delete(query, data: data),
    );
  }

  Future _sendRequest(Future<Response> request) async {
    final Response response = await request.catchError(
      (error) {
        if (error is DioError) {
          // getIt.get<BaseBloc>().add(BaseEvent(
          //     errorMessage: error.response?.data['msg'] ?? error.message,
          //     requestError:
          //         HttpRequestException.fromJson(error.response?.data)));
          // throw HttpRequestException.fromJson(error.response?.data);
        }
      },
    );
    final result = response.data;
    if (result['ok'] == true) {
      return result['result'] ?? true;
    } else {
      return false;
    }
  }

  Future<void> _setInterceptors() async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // accessToken ??= await _storage.readAccessToken();
          if (accessToken != null) {
            options.headers["Authorization"] = "Bearer $accessToken";
          }
          if (_showLog) {
            println("\n---------- DioRequest ----------"
                "\n\turl: ${options.baseUrl}${options.path}"
                "\n\tquery: ${options.queryParameters}"
                "\n\tmethod: ${options.method}"
                "\n\tdata: ${options.data}"
                "\n\theaders: ${options.headers}\n}"
                "\n--------------------------------\n");
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          final options = response.requestOptions;
          if (_showLog) {
            println("\n---------- DioResponse ----------"
                "\n\turl: ${options.baseUrl}${options.path}"
                "\n\tmethod: ${options.method}"
                "\n\tresponse: $response"
                "\n--------------------------------\n");
          }
          return handler.next(response);
        },
        onError: (error, handler) async {
          final options = error.requestOptions;
          if (_showLog) {
            println("\n---------- DioError ----------"
                "\n\turl: ${options.baseUrl}${options.path}"
                "\n\tmethod: ${options.method}"
                "\n\tmessage: ${error.message}"
                "\n\tresponse: ${error.response}"
                "\n--------------------------------\n");
          }
          // if (error.response?.data['code'] ==
          //         HttpRequestErrors.authTokenExpired &&
          //     canRefresh) {
          //   canRefresh = false;
          //   await refreshToken();
          //   if (!canRefresh) return;
          // }
          return handler.next(error);
        },
      ),
    );
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  // Future<void> refreshToken() async {
  //   accessToken = await _storage.readRefreshToken();
  //   final responseData = await _sendRequest(
  //     _dio.post("/auth/token/refresh"),
  //   );
  //   canRefresh = true;
  //   accessToken = responseData["access"];
  //   await _storage.writeRefreshToken(responseData["refresh"]);
  //   await _storage.writeAccessToken(accessToken!);
  // }
}
