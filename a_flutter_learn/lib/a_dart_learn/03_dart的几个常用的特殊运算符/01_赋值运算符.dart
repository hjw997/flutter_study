void main(List<String> args) {
  //test1();
  test2();
}

/// 1.  ??=  Null-aware (null感知运算符)
/// ??=
/// obj ??= value
/// 若obj为null, 把value赋值给obj.
void test1() {
  /// 1.??=:   ?? 和 = 中间不要有空格.
  /// 当原来的变量有值时, 那么??= 不执行
  /// 原来的变量为null, 那么将值赋值给这个变量
  String? name1 = "abc";

  /// dart 2.0 以后加入 空安全. 只有 可空的 才能赋值为 null
  name1 = null;
  name1 ??= "lilei";
  print(name1);

  /// 如果这里写个具体类型(自动推断一个部位 null 的类型 )   这个运算符 就不能使用了.
  var name2 = null;
  name2 ??= "rose";

  /// 如果给一个可推断的具体类型 就不会执行 ??=
  var name3 = "abc";
  ///name3 ??= "Jack";

  ///⚠️The left operand can't be null, so the right operand is never executed.

}

/// 条件运算符：??
/// 相当于一个 三目运算符.
/***
    1.使用 if :
    String? gender;
    if(person.gender!=null){
         gender = person.gender;
    }else{
        gender = '未知';
    }
    2.使用三目运算符:
    String gender = person.gender!=null ? person.gender : '未知';

    3. ?? 运算符
    String gender = person.gender ?? '未知';

 */

/// String gender = person.gender!=null ? person.gender : '未知';
//
void test2() {
  /// ??:
  /// ??前面的数据有值, 那么就使用??前面的数据
  /// ??前面的数据为null, 那么就使用后面的值
  var name = null;
  var temp = name ?? "lilei";
  print(temp);
}


/// 可以参考文章:
/// https://blog.csdn.net/yongshiaoteman/article/details/106027645