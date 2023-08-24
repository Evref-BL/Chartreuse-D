import 'package:project_b/src/somepack/class_b.dart';

class ClassA {
  void method() {
    var classBLocalVariable = ClassB();
    classBLocalVariable.methodOfB();
  }
}
