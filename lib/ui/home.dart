import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/extensions/navigation_ext.dart';
import 'package:flutter_module/ui/screen_callback.dart';
import 'package:flutter_module/ui/screen_counter.dart';
import 'package:flutter_module/ui/screen_flow_one.dart';
import 'package:flutter_module/ui/screen_one.dart';
import 'package:flutter_module/ui/screen_two.dart';

import '../functions/math_functions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                MaterialButton(
                  onPressed: () {
                    context.navigateTo(const ScreenCounter());
                  },
                  color: Colors.blue,
                  child: const Text("Counter"),
                ),
                MaterialButton(
                  onPressed: () {
                    context.navigateTo(const ScreenCallback());
                  },
                  color: Colors.blue,
                  child: const Text("Callback"),
                ),
                MaterialButton(
                  onPressed: () {
                    context.navigateTo(const ScreenOne());
                  },
                  color: Colors.blue,
                  child: const Text("Screen one"),
                ),
                MaterialButton(
                  onPressed: () {
                    context.navigateTo(const ScreenTwo(title: "Screen Title"));
                  },
                  color: Colors.blue,
                  child: const Text("Screen Two"),
                ),
                MaterialButton(
                  onPressed: () {
                    context.navigateTo(const ScreenFlowOne());
                  },
                  color: Colors.blue,
                  child: const Text("Screen Flow"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
