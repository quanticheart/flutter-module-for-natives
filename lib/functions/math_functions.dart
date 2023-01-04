import 'package:flutter/services.dart';

extension MathExt on int {
  int flutterExtensionPlusMath(int value) => this + value;
}

class MathFlutter {
  static int flutterStaticPlusMath(int value1, int value2) => value1 + value2;

  int flutterPrivatePlusMath(int value1, int value2) => value1 + value2;
}

int flutterGlobalPlusMath(int value1, int value2) => value1 + value2;

abstract class CallbackFlutterClass {
  void test1();

  void test2(int valueToMath);

  int test3(int valueToMath);

  void test4(int valueToMathFromTest3);
}

class TestFlutterCallback {
  testWithClassCallback(int valueToMath, CallbackFlutterClass callback) {
    int math = valueToMath.flutterExtensionPlusMath(valueToMath);

    callback.test1();

    callback.test2(math);

    int intFromNative = callback.test3(math);

    callback.test4(intFromNative);
  }

  testWithLambdaCallback(Function() callback) {
    callback();
  }

  testWithLambdaNullCallback(Function()? callback) {
    if (callback != null) callback();
  }

  testWithLambdaValueCallback(Function(int) callback) {
    callback(10);
  }

  testWithLambdaValueStringCallback(
      int constantToVerify, Function(String) callback) {
    switch (constantToVerify) {
      case 0:
        callback("OK");
        break;
      case 1:
        callback("ERROR");
        break;
      case 2:
      case 3:
        callback("OK WITH VALUES");
        break;
      default:
        callback("DEFAULT");
        break;
    }
  }
}
