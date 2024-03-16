import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService {
  late Dio _dio;

  static DioService? _instance;

  Dio get dio => _dio;

  factory DioService() => _instance ??= DioService._internal();

  DioService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://dev-carik.jakarta.go.id',
        connectTimeout: const Duration(milliseconds: 300000),
        headers: {
          'accept': 'application/json',
          'content-type': 'application/json',
        },
      ),
    );


    if (!kReleaseMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 150,
        ),
      );
    }
  }
}