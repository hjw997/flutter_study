void main(List<String> args) {
    /// 1.明确申明
    String name = "jack";

    /// 2. 类型推导 三种方式 var / final / const
    var age = 20; ///类型可以自己推导.
    /////runtimeType用于获取变量当前的类型
    print(age.runtimeType); //int

    //age = "abc" ❌

    /// final 申明常量 -- 一次赋值后不可改.运行时候确定
    final height = 1.88;
    final weight ;
    weight = 80 ;

    /// const 声明 --编译时常量
    //const address;
    //address = "背景"
    /// const 必须赋值.常量值(编译期需要有一个确定的值)
    const address = "北京市";

    /// 区别
    //const date1 = DateTime.now();
    /// 运行期 final 用的多. const 可以共享对象.
    final date2  = DateTime.now();

}

// class Person {
//     late String name;
//     Person(String name) {
//         this.name = name;
//     }
// }

class Person {
    final String name;
    /// 常量构造函数
    const Person(this.name);
}


