main(List<String> args) {
  var p = Person("why", 18);
}

class Person {
  String name;
  int age;

  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  Person(this.name, this.age);
}

