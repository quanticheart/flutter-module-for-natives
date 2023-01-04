import 'package:flutter/material.dart';
import 'package:flutter_module/extensions/navigation_ext.dart';

class ScreenFlowTwo extends StatefulWidget {
  const ScreenFlowTwo({super.key});

  @override
  State<ScreenFlowTwo> createState() => _ScreenFlowTwoState();
}

class _ScreenFlowTwoState extends State<ScreenFlowTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Flow Two"),
        leading: BackButton(
          onPressed: () {
            context.finish();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Screen in Flow',
            ),
          ],
        ),
      ),
    );
  }
}
