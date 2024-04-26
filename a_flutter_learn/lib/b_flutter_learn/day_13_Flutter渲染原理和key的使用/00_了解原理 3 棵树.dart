import 'package:flutter/material.dart';

/// 这个项目是 flutter create xxx 生成的项目模板. 计数器模板代码.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class TestStateless extends StatelessWidget {
  const TestStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  /// Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'You have pushed the button this many times:',
                ),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// 1.什么是 BuildContext,有何作用?
///
///
/// 2.Widget 的构造函数中的 可选参数key 是什么? 有何作用?
///
///
/// 3.Widget 的 build 方法 会频繁的创建, 频繁创建会影响性能么?
///
///
///
/// 首先了解 3 棵树 .
/// https://juejin.cn/post/6844904170571431944
/// Flutter 引擎会创建三棵树:不会直接去渲染 Widget-Tree(因为它特别不稳定,一老去调用 build 方法返回 Widget)
/// Widget-Tree 和 RenderObjectTree 不一定是一一对应的.
/// Flutter引擎真实的渲染树是 RenderObject-Tree. 并不是所有的 Widget 是可以渲染的,比如 Text  是 StatelessWidget 的 build 方法中看真实的返回对象.
/// Render-Tree 是最终渲染的 Tree.
/// Widget 的灵感: https://docs.flutter.dev/ui 来自 React .
/// 虚拟 Dom 本质就是 JS 对象,前端中 HTML 转为 js 对象来描述 HTML 结构,这个 JS 对象就是 虚拟 DOM.
/// Element 就是和 虚拟 Dom一样.
/// 关于 Element 官方文档: https://api.flutter.dev/flutter/widgets/Element-class.html
///
/// 我们看一个 Widget 源码的时候 看是 StatelessWidget (看 build 方法) , 还是 StatefulWidget (看 对应 createState 出的State 对象的 build) 方法, 看实际出来的是 什么 Widget.
/// 还有一种就是 如果一个 Widget(如 Padding, Column, Row 最终是 RenderObjectWidget , 那么里面有两个 抽象方法:
///  1.9-
/// Padding 这种 是 RenderObject
///
///
/// 1.自己写Widget
/// 2.某些Widget(渲染 Widget ) 中会创建RenderObject
/// 3.每一个Widget都会创建一个Element对象,但是创建的 Element 是不一样的的.
///  widget 创建完 Element 之后 flutter 引擎会调用 Element 的 mount 方法:
/// 4.1.ComponentElement: mount方法 执行过程: -> firstBuild -> rebuild -> performBuild -> build -> _widget.build
/// 4.2.RenderObjectElement: mount方法 -> _widget.createRenderObject
/// 4.3.StatefulElement:
/// * 构造方法中 _state = widget.createState()
/// * _state._widget = widget;

/// 课堂分析过程:----------------------------✅

/// 所有的Widget都会创建一个对应的Element对象
///    StatelessElement;
///    StatefulElement;

/// 组件Widget: 不会生成 RenderObject
///   Container 继承关系: Container -> StatelessWidget -> Widget
///    Container -> StatelessWidget -> Widget
///    Container();
///    Text();
///    HYHomeContent();

/// 创建Element: RenderObjectElement
/// 渲染Widget: 生成RenderObject
/// 查看 Padding 继承关系:
/// Padding -> SingleChildRenderObjectWidget -> RenderObjectWidget(抽象方法:createRenderObject,子类 Padding 中实现.) -> Widget
/// Padding ->实现了 createRenderObject 创建出:RenderPadding对象. (RenderPadding的继承关系: RenderPadding -> RenderBox -> RenderObject)
///    Padding();
///    RenderObjectWidget
///
/// 看完 Container 和 Padding 发现 Widget 继承关系:
/// RenderObjectWidget : 特点有个抽象方法: RenderObject createRenderObject();由子类创建 Padding 中.
/// Padding ->实现了 createRenderObject 创建出:RenderPadding对象. (RenderPadding的继承关系: RenderPadding -> RenderBox -> RenderObject)
/// 所以我们就明白了 一个 RenderObjectWidget 对象最终会创建一个 RenderObject 对象.  是如何创建一个 RenderObject 了.
/// 但是 想 Container 继承自 StatelessWidget [StatefulWidget] 这样的是没有 createRenderObject 的.这也是组件 Widget 和渲染 widget 和核心区别.
/// 每一个 Widget 都会创建一个 Element.因为 Widget 类中有个抽象方法叫做 Element createElement(); 所以不管是渲染 Widget 还是 非渲染 Widget 都会去创建一个 Element.
/// 再看 Container 中有没有创建 Element createElement(),发现在父类的 StatelessWidget 中有实现 返回 StatelessElement
/// 所以 每一个Widget都会创建一个Element对象,但是创建的 Element 是不一样的的.
/// 比如 StatelessWidget 创建的是:   StatelessElement createElement() => StatelessElement(this);
///     StatefulWidget  创建的是:   StatefulElement createElement() => StatefulElement(this);
///     StatelessElement 和 StatefulElement 都继承自 ComponentElement.
///      StatelessElement 和 StatefulElement 比较发现 StatefulElement多个 state 属性对自己创建的 State 有个引用.
/// 再看 Padding 这样的渲染组件创建的 createElement 是什么类型呢?
/// 发现 Padding 的父类中实现了这个方法: SingleChildRenderObjectElement createElement() => SingleChildRenderObjectElement(this);
/// 发现传入的 this 一直传到了父类的 Element 中的 _widget 属性. 所以每个 Element其实对 Widget 是有个引用的
///
///  创建完 Element 后呢?
///  widget 创建完 Element 之后 flutter 引擎会调用 Element 的 mount 方法,
///  看方法上面的注释,The framework calls this function when a newly created element is added to the tree for the first time...
///  调用 mount 的作用是啥? ✅
///
///  ComponentElement: mount方法 执行过程:
///  >> 1.先看 StatelessElement 找 mount实现方法: 发现是 父类 ComponentElement 实现了 Element 的  mount 方法:
///  Element 中 mount 方法一路调用: _firstBuild() -> rebuild() ->  performRebuild( void performRebuild() {
///     _dirty = false; /// Element 抽象类中的实现方法就是做了个 _dirty 的标记.
///   }); 然后子类:
///   子类 ComponentElement 复写了 performRebuild , 里面最主要 有个方法: void performRebuild() { built = build()};
///   注意这个 build() 方法是 ComponentElement 类中的抽象方法( [StatelessWidget.build] or [State.build]) for their widget.)
///   StatelessElement 中实现:   Widget build() => (widget as StatelessWidget).build(this); 因为每个 Element 中对 Widget 有个引用. 所以调用了 widget的 build 方法,
///   参数是 this,到具体某个 Widget 时候就是 build(BuildContext context) 参数. 所以 BuildContext context 揭开了神秘面纱✅. 就是当前的 Element.
///   所以:Widget 在什么时候调用了 Build 方法揭开面纱.
///
///   2. 再看:渲染 Widget 的 RenderObjectElement
///   SingleChildRenderObjectElement createElement() => SingleChildRenderObjectElement(this); 创建的是 SingleChildRenderObjectElement 类型,我们去里面看 mount 方法:
///   super.mount方法: 也就是 Element 最顶层的 mount 方法最核心作用就是 把自己 挂载到 Element tree 中. 因为看参数有传入 parent进来
///   一直找到 父类的 RenderObjectElement 方法发现有一句 核心代码:
///   _renderObject = (widget as RenderObjectWidget).createRenderObject(this);
///   所以上面这句就是对 第三棵树的 RenderTree 中的 RenderObject 创建并且 该 Element _renderObject 对 RenderObject的引用.
///   这一句就是创建了 RenderObject 对象.
///   所以 组件Widget 和 渲染widget mount 方法最主要的区别就是 :
///    4.1.ComponentElement: mount方法 执行过程: -> firstBuild -> rebuild -> performBuild -> build -> _widget.build 组件Widget 是最终调用 build 方法.
///    4.2.RenderObjectElement: mount方法 -> _widget.createRenderObject  渲染Widget主要是创建RenderObject.
///   3.再看  StatefulWidget 中,  StatefulElement createElement() => StatefulElement(this);
///   StatefulElement : 构造方法中
///     StatefulElement(StatefulWidget widget) : _state = widget.createState(), ✅✅✅: 这里就去创建 State 并且持有 state 对象的引用.
///      state._widget = widget;✅✅ 这句赋值  就知道 为何 state 中对 widget 有个引用. 也就是在 StatefulWidget 对象中创建的 createState State 对象中对 widget 有个引用.
///      所以我们才能在 State中 this.widget 这样去访问对应的 StatefulWidget .
///
///     一旦一个 widget 创建完 Element 后就会调用 Element 的 mount 方法.所以我们再看 StatefulElement 的 mount 方法:
///     我们在StatelessElement 没有找到 mount 方法那就看父类的.
///
///     ComponentElement 的 mount 方法调用 -> _firstBuild() -> (父类的 Element 的  rebuild() )  ->  (父类的 Element 的  performRebuild() ) -> (子类 ComponentElement 覆写: performRebuild )
///     覆写的 performRebuild   ComponentElement 中的 Widget build(); 这个抽象方法: 还记得 ComponentElement 有子类 StatefulElement 和 StatelessElement
///           StatefulElement:中有个 State 对象,然后调用 state.build(this) 这样就调用到 StatefulWidget 中的 build 方法中了.
///               Widget build() => state.build(this);
///           StatelessElement中:
///           `` Widget build() => (widget as StatelessWidget).build(this); 这样就调用到了 StatelessWidget中的 build 方法中了.
///
///   createElement ? 什么时候创建呢? 一个Widget 创建完毕后 就会调用 mount 中会调用 inflateWidget 然后 widget 的 creatElement 方法创建 对应的 Element 方法.
///   更具体的再学习 主要是 widget 创建后怎么创建了 Element 不太理解.
///   一些文章参考: https://juejin.cn/post/7038087364060659725
///
///     https://cloud.tencent.com/developer/article/2113826?areaId=106001
///     后期继续 从 runApp 开始继续研究.
///
///     以上就是三棵树的 关系.
///
///
///
///
///
