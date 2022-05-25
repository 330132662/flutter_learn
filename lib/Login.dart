import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.green,
      home: LoginState(),
    );
  }
}

class LoginState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFul();
  }
}

class _LoginFul extends State<LoginState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("123"),
        // toolbarHeight: 40,
      ),
      body: Column(
        //https://blog.csdn.net/chuyouyinghe/article/details/118419569
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Image.asset(
                'image/logo.png',
                width: 100,
                height: 100,
              )),
          Container(
            child: Text(
              "中星快充",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '请输入手机号',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextFormField(
              //https://www.jianshu.com/p/ecf052d56a26
              // http://events.jianshu.io/p/ad231ab22cee
              obscureText: true,
              decoration: InputDecoration(
                hintText: '请输入密码',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
            decoration: BoxDecoration(
              //https://blog.csdn.net/weixin_43120901/article/details/122344646
              gradient: LinearGradient(
                  colors: [Color(0xff33C8FF), Color(0xFF3399FF)]),
              borderRadius: BorderRadius.circular(200),
            ),
            child: ElevatedButton(
              child: const Text("登录"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.fromLTRB(0, 15, 0, 15),
                  ),
                  enableFeedback: true,
                  /*shape: MaterialStateProperty.all(StadiumBorder(
                      side: BorderSide(
                          style: BorderStyle.solid, color: Colors.blue))),*/
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
