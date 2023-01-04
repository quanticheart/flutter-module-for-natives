import 'package:flutter/material.dart';

class SplashScreenActivity extends StatelessWidget {
  const SplashScreenActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.ac_unit,
              color: Colors.blueAccent,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
