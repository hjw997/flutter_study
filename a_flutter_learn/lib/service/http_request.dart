
import 'package:a_flutter_learn/service/config.dart';
import 'package:dio/dio.dart';

/// 网络请求的工具类: 封装了 Dio

class HttpRequest {
  /// 公共的可以配置到这里来: 如 header 放token 等.
  static final BaseOptions _baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);

  static final Dio _dio = Dio(_baseOptions);

  /// 泛型: 最好请求的时候给跟它指定, 返回的是什么类型的
  static Future<T> request<T>(String url,
      {String method = "get", /// 默认的请求方法:
      Map<String, dynamic>? params, ///请求的参数
      Interceptor? customerInter,/// 客户自定义的拦截器
      }) async {

    /// 1. 单独创建一个 option 最后发送请求的时候添加到option中.
    final anOption = Options(method: method);/// 这个里面可以单独配置 header 等.

    /// 2.全局拦截器
    Interceptor defaultInterceptor = InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
        // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
        print("请求开始-onRequest $options");
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
        print("请求响应-onResponse $response");
        return handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
        return handler.next(error);
      },
    );

    var inters = [defaultInterceptor];
    if (customerInter != null) {
      inters.add(customerInter);
    }
    _dio.interceptors.addAll(inters);

    /// 3.发送网络请求: 这里使用try-catch
    try {
      Response response =   await _dio.request(url, queryParameters: params, options: anOption);
      return response.data;
    } on DioException catch (e) {
      /// 这里用Future.error  error 包装 外面才会调用到 onErrorcatch 的那个回调中.
      return Future.error(e);
    }
  }
}