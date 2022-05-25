import 'package:flutter/material.dart';
import 'package:flutter2_8_1/Login.dart';

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
    return MaterialApp(title: "hello  xxl", home: HomeFul());
  }
}

class HomeFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<HomeFul> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter真是个奇怪的东西"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text("第四次学习Flutter  hhh"),
            ElevatedButton(
                onPressed: () {
                  // Navigator.pop(context);
                  _jump(context);
                },
                child: const Text("登录"))
          ],
        ),
      ),
    );
  }

  _jump(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
