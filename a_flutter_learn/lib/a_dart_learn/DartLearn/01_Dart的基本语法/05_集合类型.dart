main(List<String> args) {
  /// 1.列表List: [];
  var names = ["abc", "cba", "nba", "cba"];
  names.add("mba");
  names.remove("abc");


  /// 2.集合Set: {}; Set 中的元素不可以重复.
  var movies = {"星际穿越", "大话西游", "盗梦空间"};

  ///Set<String>.from 是命名构造函数
  Set<String>.from(names).toList();
  names = Set<String>.from(names).toList();
  print(names);

  /// 3.映射Map
  var info = {
    /// key - 必须是可哈希的.
    "name": "why",
    "age": 18
  };
  print(info);

}