
/// 网络相关的配置, 抽象类是为了不让其初始化.
abstract class HttpConfig {
  static const baseURL = "http://httpbin.org/";
  static const timeout = Duration(seconds: 5);
}