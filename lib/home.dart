import 'package:flutter/material.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  /**\
   *
   * 第二界面
   */
  const HomeApp({Key? key}) : super(key: key);

  // static final routeName = '/home_route';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hello  xxl",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("flutter真是个奇怪的东西"),
        ),
        body: const Center(
          child: Text("第四次学习Flutter"),
        ),
      ),
    );
  }
}
