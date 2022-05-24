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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("第四次学习Flutter  hhh"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("蒙多，想去哪就去哪儿"))
            ],
          ),
        ),
      ),
    );
  }
}
