import 'package:dio/dio.dart';

abstract class IApi {
  Future<dynamic> get(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onReceiveProgress,
  });

  Future<dynamic> post(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<dynamic> put(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<dynamic> patch(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<dynamic> delete(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    Options? options,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  });

  Future<dynamic> fetch(
    Uri uri, {
    String? method,
    int? sendTimeout,
    int? receiveTimeout,
    int? connectTimeout,
    Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    String? baseUrl,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
    String? contentType,
    ValidateStatus? validateStatus,
    bool? receiveDataWhenStatusError,
    bool? followRedirects,
    int? maxRedirects,
    RequestEncoder? requestEncoder,
    ResponseDecoder? responseDecoder,
    ListFormat? listFormat,
    bool? setRequestContentTypeWhenNoPayload,
  });
}
