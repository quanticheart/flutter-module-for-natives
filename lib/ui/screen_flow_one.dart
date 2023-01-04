import 'package:flutter/material.dart';
import 'package:flutter_module/extensions/navigation_ext.dart';
import 'package:flutter_module/ui/screen_flow_two.dart';

class ScreenFlowOne extends StatefulWidget {
  const ScreenFlowOne({super.key});

  @override
  State<ScreenFlowOne> createState() => _ScreenFlowOneState();
}

class _ScreenFlowOneState extends State<ScreenFlowOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Flow One"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                context.navigateTo(const ScreenFlowTwo());
              },
              color: Colors.blue,
              child: const Text("Go to screen Two"),
            ),
          ],
        ),
      ),
    );
  }
}
