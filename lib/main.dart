import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/functions/math_functions.dart';
import 'package:flutter_module/ui/home.dart';
import 'package:flutter_module/ui/screen_callback.dart';
import 'package:flutter_module/ui/screen_one.dart';
import 'package:flutter_module/ui/splash.dart';

import 'native_constantes.dart';

void main() {
  runApp(chooseWidget(window.defaultRouteName));
}

@pragma('vm:entry-point')
void screenCallback() => runApp(const ScreenCallbackActivity());

Widget chooseWidget(String route) {
  switch (route) {
    case 'splashRoute':
      return const SplashScreenActivity();
    case 'screenOne':
      return const ScreenOneActivity();
    case 'screenCallback':
      return const ScreenCallbackActivity();
    default:
      return const MyApp();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MethodChannel platform =
      const MethodChannel("$defaultNativeChannel/methods_for_native");

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(_methodsRegister);
    "Flutter Main initState, register methods success".printObject();
  }

  Future<dynamic> _methodsRegister(MethodCall call) async {
    "Flutter handle method call from native => ${call.method}".printObject();
    handleMethodNative(() {
      try {
        if (call.method == "flutterIntPlus") {
          final Map<Object?, Object?> data = call.arguments;
          int result = (data["value1"] as int).flutterExtensionPlusMath(data["value2"] as int);
          platform.invokeMethod("callbackMethodFromFlutter", {"result": result});
          return {"result": result};
        }

        if (call.method == "getPrintLog2") {
          // final Map<Object?, Object?> data = call.arguments;
          print("OK FLUTTER 2");
          platform.invokeMethod("callbackMethodFromFlutter", "ok");
        }

        return null;
      } on PlatformException catch (error) {
        error.printObject();
        return error;
      } on Exception catch (error) {
        error.printTag("FLUTTER ERROR");
        return error;
      } catch (error) {
        error.printTag("FLUTTER ERROR");
        return error;
      }
    }).handleException((error) => {error.printObject()});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
