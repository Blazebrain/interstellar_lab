import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio_client;
import 'package:flutter/foundation.dart';
import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/app/app.logger.dart';
import 'package:interstellar_labs/utils/export_utils.dart';
import 'package:stacked_services/stacked_services.dart';

import 'api.dart';

class ApiService implements IApi {
  final log = getLogger('ApiService');
  final _snackBarService = locator<SnackbarService>();
  late final dio_client.Dio dio;

  ApiService() {
    _createDio();
    log.i('API service initialized');
  }

  dio_client.Dio _createDio() {
    dio = dio_client.Dio();
    dio
      ..options.baseUrl = ApiConstants.tmdbBaseUri.toString()
      ..options.connectTimeout = ApiConstants.connectTimeout
      ..options.sendTimeout = ApiConstants.sendTimeout
      ..options.responseType = dio_client.ResponseType.json
      ..options.receiveTimeout = ApiConstants.receiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    if (kDebugMode) {
      dio.interceptors.add(dio_client.LogInterceptor(
          logPrint: (print) {
            log.i(print);
          },
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true));
      dio.interceptors.add(
        dio_client.InterceptorsWrapper(
          onRequest: (dio_client.RequestOptions options,
              dio_client.RequestInterceptorHandler handler) async {
            return handler.next(options);
          },
          onResponse: (dio_client.Response response,
              dio_client.ResponseInterceptorHandler handler) {
            return handler.next(response);
          },
          onError: (dio_client.DioError e,
              dio_client.ErrorInterceptorHandler handler) async {
            log.e(e.error);
            return handler.next(e);
          },
        ),
      );
    }

    return dio;
  }

  void _throwOnFail(dio_client.Response response) {
    if (!response.statusCode.toString().contains('20')) {
      final failure = Failure.fromHttpErrorMap(json.decode(response.data));
      throw failure;
    }
  }

  @override
  Future get(Uri uri,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      dio_client.CancelToken? cancelToken,
      dio_client.Options? options,
      dio_client.ProgressCallback? onReceiveProgress}) async {
    return await _performRequest(
      dio.get(
        uri.toString(),
        queryParameters: queryParameters,
        options: options ?? dio_client.Options(headers: headers),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  @override
  Future post(Uri uri,
      {required Map<String, dynamic> body,
      Map<String, dynamic>? queryParameters,
      dio_client.CancelToken? cancelToken,
      Map<String, dynamic>? headers,
      dio_client.Options? options,
      dio_client.ProgressCallback? onSendProgress,
      dio_client.ProgressCallback? onReceiveProgress}) async {
    return await _performRequest(
      dio.post(
        uri.toString(),
        data: body,
        queryParameters: queryParameters,
        options: options ?? dio_client.Options(headers: headers),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  @override
  Future patch(Uri uri,
      {required Map<String, dynamic> body,
      Map<String, dynamic>? queryParameters,
      dio_client.CancelToken? cancelToken,
      Map<String, dynamic>? headers,
      dio_client.Options? options,
      dio_client.ProgressCallback? onSendProgress,
      dio_client.ProgressCallback? onReceiveProgress}) async {
    return await _performRequest(
      dio.patch(
        uri.toString(),
        data: body,
        queryParameters: queryParameters,
        options: options ?? dio_client.Options(headers: headers),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  @override
  Future delete(Uri uri,
      {required Map<String, dynamic> body,
      Map<String, dynamic>? headers,
      dio_client.Options? options,
      Map<String, dynamic>? queryParameters,
      dio_client.CancelToken? cancelToken}) async {
    return await _performRequest(
      dio.delete(
        uri.toString(),
        data: body,
        queryParameters: queryParameters,
        options: options ?? dio_client.Options(headers: headers),
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future put(Uri uri,
      {required Map<String, dynamic> body,
      Map<String, dynamic>? queryParameters,
      dio_client.Options? options,
      dio_client.CancelToken? cancelToken,
      Map<String, dynamic>? headers,
      dio_client.ProgressCallback? onSendProgress,
      dio_client.ProgressCallback? onReceiveProgress}) async {
    return await _performRequest(
      dio.put(
        uri.toString(),
        data: body,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters,
        options: options ?? dio_client.Options(headers: headers),
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future fetch(Uri uri,
      {String? method,
      int? sendTimeout,
      int? receiveTimeout,
      int? connectTimeout,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      dio_client.ProgressCallback? onSendProgress,
      dio_client.ProgressCallback? onReceiveProgress,
      dio_client.CancelToken? cancelToken,
      String? baseUrl,
      Map<String, dynamic>? extra,
      Map<String, dynamic>? headers,
      dio_client.ResponseType? responseType,
      String? contentType,
      dio_client.ValidateStatus? validateStatus,
      bool? receiveDataWhenStatusError,
      bool? followRedirects,
      int? maxRedirects,
      dio_client.RequestEncoder? requestEncoder,
      dio_client.ResponseDecoder? responseDecoder,
      dio_client.ListFormat? listFormat,
      bool? setRequestContentTypeWhenNoPayload}) async {
    return await _performRequest(
      dio.fetch(
        dio_client.RequestOptions(
          path: uri.toString(),
          data: body,
          headers: headers,
          baseUrl: baseUrl,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          connectTimeout: connectTimeout,
          contentType: contentType,
          extra: extra,
          followRedirects: followRedirects,
          listFormat: listFormat,
          maxRedirects: maxRedirects,
          method: method,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onReceiveProgress,
          receiveDataWhenStatusError: receiveDataWhenStatusError,
          receiveTimeout: receiveTimeout,
          requestEncoder: requestEncoder,
          responseDecoder: responseDecoder,
          responseType: responseType,
          sendTimeout: sendTimeout,
          setRequestContentTypeWhenNoPayload:
              setRequestContentTypeWhenNoPayload,
          validateStatus: validateStatus,
        ),
      ),
    );
  }

  /// Try/catch to wrap api calls
  Future _performRequest(Future<dio_client.Response<dynamic>> apiCall) async {
    try {
      final response = await apiCall;
      _throwOnFail(response);
      return response.data;
    } on FormatException {
      throw Failure(message: 'Error sending request');
    } on SocketException {
      throw Failure(message: 'Please check your internet connection');
    } on dio_client.DioError catch (e) {
      if (e.message.contains('SocketException')) {
        _snackBarService.showCustomSnackBar(
          message:
              'Error connecting to the Internet.\nCheck your network connection and pull to refresh',
          title: 'Error',
          variant: SnackBarType.error,
          duration: const Duration(seconds: 5),
        );
      }
      log.e(e.type.toString());
      log.e(e.error);
      log.e(e.response.toString());
      log.e(e.response?.statusMessage);
      log.e(e.response?.data);
      throw Failure(
          message: e.response?.statusMessage ?? '',
          data: json.decode(e.response.toString()));
    } catch (e) {
      rethrow;
    }
  }
}

class Failure {
  final String message;
  final Map<String, dynamic>? data;

  Failure({
    required this.message,
    this.data,
  });

  factory Failure.fromHttpErrorMap(Map<String, dynamic> json) => Failure(
        message: json["error"]["message"],
        data: json["data"],
      );

  @override
  String toString() {
    return 'Failure{message: $message, data: $data}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          data == other.data;

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}
