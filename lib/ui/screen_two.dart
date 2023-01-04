import 'package:flutter/material.dart';

class ScreenTwoActivity extends StatelessWidget {
  const ScreenTwoActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenTwo(
        title: 'Test',
      ),
    );
  }
}

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key, required this.title});

  final String title;

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Screen One',
            ),
          ],
        ),
      ),
    );
  }
}
