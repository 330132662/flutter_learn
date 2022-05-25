import 'package:flutter/material.dart';
import 'package:flutter2_8_1/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.white,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  /**
   *  第一界面
   */
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  /* 一个执行函数 */
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /**
   *  学习路由跳转
   */
  _jump(BuildContext context) {
    print(":asdasdsd");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeApp()));
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _buildButtonColumn(color, Icons.call, 'CALL'),
      _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
      _buildButtonColumn(color, Icons.share, 'SHARE'),
    ]);

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: <Widget>[
          Image.asset(
            'image/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection, buttonSection,
          Center(
              child: Row(
            children: [
              Image.asset(
                'image/lake.jpg',
                width: 100,
                height: 50,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.green,
                width: 200,
                height: 100,
              ),
            ],
          )),
          //https://www.jianshu.com/p/eebf7f7b1cfd
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),

          // https://flutter.cn/docs/development/ui/layout/tutorial 标题行
          /*const Text(
              'You have pushed the button this many times:',
            ),*/
          /*Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),*/
          // Text('跳转123'),
          TextButton(
                child: const Text("按钮：点我跳转"),
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15)),
                // onPressed: _jump(context))
                onPressed: () {
                  _jump(context);
                })
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
