import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';
import 'package:hotel_manage/routers/index.dart';

abstract class JsonConvertible {
  Map<String, dynamic> toJson();
}

class HttpRequest {
  static final HttpRequest _instance = HttpRequest._internal();
  static HttpRequest get instance => _instance;

  late Dio _dio;
  String _baseUrl = 'https://hotel.yuyangyun.cn/app-api/';
  String? _token = '';

  HttpRequest._internal() {
    _initDio();
  }

  void _initDio() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_token != null) {
          options.headers['Authorization'] = _token;
        }
        handler.next(options);
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (error, handler) {
        print('错误: ${error.message}');
        if (error.response != null) {
          print('错误响应: ${error.response!.statusCode} ${error.response!.data}');
        }
        handler.next(error);
      },
    ));
  }

  void setBaseUrl(String url) {
    _baseUrl = url;
    _dio.options.baseUrl = url;
  }

  void setToken(String token) {
    _token = token;
  }

  void clearToken() {
    _token = null;
  }

  void setHeaders(Map<String, String> headers) {
    _dio.options.headers.addAll(headers);
  }

  Future<ResponseComm> get(
    String path, {
    dynamic queryParameters,
  }) async {
    try {
      final params = _convertToMap(queryParameters);
      final response = await _dio.get(
        path,
        queryParameters: params,
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }
  Future<ResponseComm> post(
    String path, {
    dynamic queryParameters,
  }) async {
    try {
      final params = _convertToMap(queryParameters);
      final response = await _dio.post(
        path,
        data: params,
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }


  Map<String, dynamic>? _convertToMap(dynamic data) {
    if (data == null) {
      return null;
    }
    if (data is Map<String, dynamic>) {
      return data;
    }
    if (data is JsonConvertible) {
      return data.toJson();
    }
    throw ArgumentError('Unsupported data type: ${data.runtimeType}');
  }

  Future<ResponseComm> _handleResponse(Response response) async {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {

        if(response.data['code'] == 401){
          BotToast.showText(text: response.data['msg']);
          AppRoutes.goLogin(navigatorKey.currentContext!);
          return ResponseComm(
            Code: response.data['code'],
            Msg: response.data['msg'],
            Data: response.data['data'],
          );
        }
        return ResponseComm(
          Code: response.data['code'],
          Msg: response.data['msg'],
          Data: response.data['data'],
        );
    } else {
      return ResponseComm(
        Code: response.statusCode ?? -1,
        Msg: '请求失败: ${response.statusMessage}',
        Data: null,
      );
    }
  }

  ResponseComm _handleError<T>(dynamic error) {
    String message;
    int? statusCode;

    if (error is DioException) {
      statusCode = error.response?.statusCode;
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        message = '请求超时';
        statusCode = 20000;
      } else if (error.type == DioExceptionType.connectionError) {
        message = '网络连接失败';
        statusCode = 20001;
      } else if (error.type == DioExceptionType.badResponse) {
        message = error.response?.data?['message'] ?? '请求失败';
        statusCode = 20002;
      } else {
        statusCode = 20003;
        message = error.message ?? '请求发生错误';
      }
    } else {
      statusCode = 30003;
      message = '请求发生错误: $error';
    }
    BotToast.showText(text: message);
    return ResponseComm(Code: statusCode, Msg: message, Data: null);
  }

  Dio get dio => _dio;
}