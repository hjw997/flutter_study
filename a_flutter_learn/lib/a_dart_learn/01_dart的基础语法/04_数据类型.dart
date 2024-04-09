/// --Todo: 练习
void main(List<String> args) {
    testFinalAndConst();

    /// final 用的更多点. final 定义的不是同一个对象.
    final p0_1 = Person("Rose");
    final p0_2 = Person("Rose");
    /// identical() 判断两个对象是否相等.
    print(identical(p0_1, p0_2));


    /// 使用 const 常量构造函数,构造出来的是同一个对象
    /// const放在赋值语句的右边，可以共享对象，提高性能:
    const p1 = const Person("Jack");
    const p2 = const Person("Jack");
    print(identical(p1, p2));
    /// dart2.0 以后 等式 右边的 const 是可以省略的.



    ///dynamic 相当于swift 中的Any .
    dynamic a;

}
/// final和const有什么区别呢?
/// const在赋值时, 赋值的内容必须是在编译期间就确定下来的
/// final在赋值时, 可以动态获取, 比如赋值一个函数
void testFinalAndConst() {
    /// 区别:
    /// 编译期间就要确定 , 否则报错.
    //const time = DateTime.now();
    /// 运行期 final 用的多.
    final time = DateTime.now();
}


class Person {
    final String name;
    /// 常量构造函数
    const Person(this.name);
}

