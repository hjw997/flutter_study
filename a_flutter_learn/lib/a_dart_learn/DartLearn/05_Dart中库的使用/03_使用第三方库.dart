
/// 三方库都使用如下方式导入 也是可以 使用 as 起别名地哈.
import 'package:http/http.dart' as http;

main(List<String> args) async {
  ///免费数据网站:
  ///https://jsonplaceholder.typicode.com/
  ///
  /// 下面是红元老师的免费服务器:
  ///
  var url = Uri.parse("http://123.207.32.32:8000/home/multidata");

  var response = await http.get(url);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

