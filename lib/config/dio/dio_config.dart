import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/custom/custom.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    // Add interceptors if needed
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add headers
          options.headers['Content-Type'] = 'application/json';
          // You can add other default headers here as well
          if (!kReleaseMode) {
            CustomLogger.p("---Request---");
            CustomLogger.p(options.path, message: "Path");
            CustomLogger.pP(options.headers, message: "Headers");
            CustomLogger.p(options.method, message: "Method");
            CustomLogger.pP(options.data, message: "Data Sent");
          }
          return handler.next(options); // Continue with the request
        },
        onResponse: (response, handler) {
          if (!kReleaseMode) {
            CustomLogger.p("---Response---");
            CustomLogger.p(response.statusCode, message: "Status Code");
            CustomLogger.pP(response.data, message: "Data Received");
          }
          // Handle the response
          return handler.next(response); // Continue with the response
        },
        onError: (error, handler) {
          // Handle errors
          if (!kReleaseMode) {
            CustomLogger.p("---Error---");
            CustomLogger.p(error.requestOptions.path, message: "Path");
            CustomLogger.pP(error.requestOptions.headers, message: "Headers");
            CustomLogger.p(error.requestOptions.method, message: "Method");
            CustomLogger.pP(error.requestOptions.data, message: "Data Sent");
            CustomLogger.p(error.response?.statusCode, message: "Status Code");
            CustomLogger.pP(error.response?.data, message: "Data Received");
          }
          return handler.next(error); // Continue with the error
        },
      ),
    );
  }

  // Function to update headers dynamically
  void updateHeaders(Map<String, dynamic> headers) {
    _dio.options.headers.addAll(headers);
  }

  Dio get dio => _dio;
}
