import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

///常规配置抽象类,用于配置请求的常规配置,例如超时时间等
abstract class NetworkNormalOption {
  final int connectTimeout;
  final Map<String, dynamic> headers;

  NetworkNormalOption(this.connectTimeout, this.headers);
}

///编码抽象类,用于加密解密
abstract class NetworkCoder {}

///网络监听类
abstract class NetworkInterceptor {

  onRequest(RequestOptions options);

  onResponse(Response response);

  onError(DioError e);
}

class MyInterceptor implements NetworkInterceptor {
  @override
  onRequest(RequestOptions options) {
    return null;
  }

  @override
  onResponse(Response response) {
    print(response);
  }

  @override
  onError(DioError e) {
    // TODO: implement onError
    return null;
  }

}

class NetworkManager {
  static final Dio _dio = Dio();

  ///网络配置,内部会根据传入的实际类构造Dio
  static configure(
      {NetworkNormalOption normalOption,
      NetworkCoder coder,
      NetworkInterceptor interceptor}) {
    _dio
      ..options.merge(
          connectTimeout: normalOption?.connectTimeout,
          headers: normalOption?.headers)
      ..interceptors.add(InterceptorsWrapper(
          onRequest: interceptor.onRequest,
          onResponse: interceptor.onResponse));
  }

  ///请求依靠dio,但会转为Observable
  static Observable<Response<T>> get<T>(String path) {
    return Observable.fromFuture(_dio.get(path));
  }

//  ///请求依靠dio,但会转为Observable
  static Observable<Response<T>> post<T>(String path) {
    return Observable.fromFuture(_dio.post(path));
  }
}
