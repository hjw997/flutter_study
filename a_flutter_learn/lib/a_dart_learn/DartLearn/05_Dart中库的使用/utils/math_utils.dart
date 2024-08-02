



/// 这个报错如何处理?????
// int sum(int num1, int num2) {
//   return num1 + num2;
// }

/// 假如是我系统库文件自己封装的.
int sum(int num1, int num2) => num1 + num2;

int mul(int num1, int num2) => num1 * num2;

int min(int num1, int num2) => num1 > num2 ? num2: num1;

/// 使用 _ 就变为私有了.
int _plus(int num1, int num2) => num1 + num2;
int plus(int num1, int num2) => num1 + num2;

void test() {
  _plus(10, 20);
}
