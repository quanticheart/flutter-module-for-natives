import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/extensions/navigation_ext.dart';

import '../functions/message_generator.dart';
import '../native_constantes.dart';

class ScreenCallbackActivity extends StatelessWidget {
  const ScreenCallbackActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenCallback(),
    );
  }
}

class ScreenCallback extends StatefulWidget {
  const ScreenCallback({super.key});

  @override
  State<ScreenCallback> createState() => _ScreenCallbackState();
}

class _ScreenCallbackState extends State<ScreenCallback> {
  String textToSearch = "";
  bool isLoading = true;
  late final List<Message> data;

  MethodChannel platform =
      const MethodChannel("$defaultNativeChannel/search_details");
  MethodChannel platformCallback =
      const MethodChannel("$defaultNativeChannel/search_details_callback");

  @override
  void initState() {
    platform.setMethodCallHandler(_getSearchFields);
    super.initState();
    platform.invokeMethod("getSearchFields");
    data = MessageGenerator.generate(60, 1337);
  }

  Future<void> _getSearchFields(MethodCall call) async {
    handleMethodNative(() {
      try {
        if (call.method == "getSearchFields") {
          final Map<Object?, Object?> data = call.arguments;
          setState(() {
            textToSearch = data["text"] as String;
            textToSearch.printObject();
            isLoading = false;
          });
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Callback"),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            platformCallback
                .invokeMethod("callbackSelected", {"result": "Nothing"});
            context.finish();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Center(child: CircularProgressIndicator()),
                  ],
                )
              : ListView(
                children :[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textToSearch,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Select Item In List',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final message = data[index];
                      return GestureDetector(
                        onTap: () {
                          platformCallback.invokeMethod(
                              "callbackSelected", {"result": message.text});
                          context.finish();
                        },
                        child: Card(
                          child: SizedBox(
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  message.text,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ]
              ),
        ),
      ),
    );
  }
}
