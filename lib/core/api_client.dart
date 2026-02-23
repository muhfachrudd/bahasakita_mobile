import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8000/api', // Default for Android Emulator to localhost
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // You can add interceptors for tokens here
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      // Add auth token if available
      return handler.next(options);
    },
    onError: (e, handler) {
      return handler.next(e);
    },
  ));

  return dio;
});
