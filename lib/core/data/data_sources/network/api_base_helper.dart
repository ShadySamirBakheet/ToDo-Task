import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/core/error/exceptions.dart';

class Api {
  factory Api() => _singleton;

  Api._internal();
  static const String _url = Constants.baseUrl;
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: _url));

  static final _singleton = Api._internal();

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: _url,
        receiveTimeout: 15000, // 15 seconds
        connectTimeout: 15000,
        sendTimeout: 15000,
      ),
    );

    dio.interceptors.addAll({
      //  BearerInterceptor(oauth),
      DioCacheInterceptor(
        options: CacheOptions(
          // A default store is required for interceptor.
          store: MemCacheStore(),

          // Returns a cached response on error but for statuses 401 & 403.
          // Also allows to return a cached response
          // on network errors (e.g. offline usage).
          // Defaults to [null].
          hitCacheOnErrorExcept: [401, 403],
          // Overrides any HTTP directive to delete entry past this duration.
          // Useful only when origin server has no cache config
          // or custom behaviour is desired.
          // Defaults to [null].
          maxStale: const Duration(days: 7),
        ),
      ),
      ErrorInterceptor(dio),
    });
    return dio;
  }
}

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor(this.dio);
  final Dio dio;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw SomeThingWentWrong();
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestError();
          case 401:
            throw AuthError();
          case 404:
            throw NotFoundError();
          case 500:
            throw ServerError();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw SomeThingWentWrong();
    }

    return handler.next(err);
  }
}
