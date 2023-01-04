import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const String defaultNativeChannel = "com.quanticheart.flutter";

Exception? handleMethodNative(Function callback) {
  try {
    callback();
    return null;
  } on PlatformException catch (error) {
    error.printObject();
    return error;
  } on Exception catch (error) {
    error.printTag("FLUTTER ERROR");
    return error;
  }
}

extension ExceptionExt on Exception? {
  handleException(Function(Exception) callback) {
    if (this != null) callback(this!);
  }
}

extension ObjectExt on Object? {
  printTag(String tag) {
    String s = this != null ? this!.toString() : "Object is Null";
    String t = "$tag => ";

      print("$t$s");

  }

  printObject() {
    String s = this != null ? this!.toString() : "Object is Null";
      print(s);

  }
}
