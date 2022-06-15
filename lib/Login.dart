import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  double marginH = 30;
  TextEditingController phoneCtrl = TextEditingController(text: '');
  TextEditingController passwordCtrl = TextEditingController(text: '');

  /**
   *  用于接收 请求函数返回的数据
   */
  // late Future<LoginMEntity> loginResp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        toolbarHeight: 0,
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
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              "中星快充",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(marginH, 40, marginH, 0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneCtrl,
              decoration: InputDecoration(
                  hintText: '请输入手机号', focusedBorder: InputBorder.none),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(marginH, 20, marginH, 0),
              child: TextFormField(
                controller: passwordCtrl,
                //https://www.jianshu.com/p/ecf052d56a26
                // http://events.jianshu.io/p/ad231ab22cee
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '请输入密码',
                  focusedBorder: InputBorder.none,
                ),
              )),
          // 密码框下方
          Row(
            //https://www.jianshu.com/p/d9b5fd16c098
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(marginH, 10, 0, 0),
                    child: Text("还没有账号？"),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "立即注册！",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, marginH, 0),
                child: Text("忘记密码"),
              ),
            ],
          ),
          //登录按钮
          Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 50),
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
              onPressed: () {
                loginReq();
              },
            ),
          ),
          // 三方登录分割线
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 1,
                width: 80,
                color: Colors.grey,
              ),
              Text(
                "第三方登录方式",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                height: 1,
                width: 80,
                color: Colors.grey,
              ),
            ],
          ),
          Image.asset(
            'image/icon64_wx_logo.png',
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }

  Future<void> loginReq() async {
    print("手机号" + phoneCtrl.text + "," + passwordCtrl.text);
    var url = Uri.parse('http://chn.sdzxkc.com/api/user/login');
    http.Response response = await http.post(url,
        body: {'account': phoneCtrl.text, 'password': passwordCtrl.text});
    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    String body = response.body;
    Map<String, dynamic> jsonBody = jsonDecode(body);
    var token = jsonBody['data']['userinfo']['token'];

    if (response.statusCode == 0) {
      print("登录成功: " + token);
      //   登录成功
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString("token", token);
    }

    // print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }
}
