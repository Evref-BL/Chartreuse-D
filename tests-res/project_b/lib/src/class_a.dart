import 'package:project_b/src/somepack/class_b.dart';
import 'package:project_b/src/super_class_a.dart';

class ClassA extends SuperClassA {
  void method() {
    var classBLocalVariable = ClassB();
    classBLocalVariable.methodOfB();
  }
}
