import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_manage/api/model/account/account.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';
import 'package:hotel_manage/util/system_params.dart';
import 'package:hotel_manage/util/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _PhoneController = TextEditingController();
  final TextEditingController _PhoneValidCodeController =
      TextEditingController();

  void _sendSMSCode() {
    AccountApi.sendSmsCode(
      SendSmsCodeParams(mobile: _PhoneController.text, scene: 1),
    );
  }

  void _loginAccount() async {
    ResponseComm response = await AccountApi.validSmsCode(
      SendSmsCodeParams(
        mobile: _PhoneController.text,
        scene: 1,
        code: _PhoneValidCodeController.text,
      ),
    );

    if (response.Code != 0) {
      BotToast.showText(text: response.Msg);
      return;
    }
    AccountApi.loginAccount(
      SendSmsCodeParams(
        mobile: _PhoneController.text,
        scene: 1,
        code: _PhoneValidCodeController.text,
        socialState: getPseudoUuid(),
        socialCode:"",
        socialType:"",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            height: double.infinity,
            "lib/assets/images/login_bg.jpg",
            fit: BoxFit.fill,
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.red,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.white],
                  // 可选：设置颜色停止位置
                  stops: [0.0, 5.0],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/assets/images/logo.png",
                    width: 150,
                    height: 150,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      controller: _PhoneController,
                      decoration: InputDecoration(
                        hintText: '请输入电话号',
                        hintStyle: TextStyle(
                          fontSize: textSize,
                          color: Colors.grey[400],
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 16,
                          color: Colors.grey[400],
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            containerSmallRadian,
                          ),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                      ),
                      style: TextStyle(fontSize: textSize),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _PhoneValidCodeController,
                          onTap: () {},
                          decoration: InputDecoration(
                            hintText: '请输入验证码',
                            hintStyle: TextStyle(
                              fontSize: textSize,
                              color: Colors.grey[400],
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 16,
                              color: Colors.grey[400],
                            ),
                            suffixIcon: Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.grey[400],
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                containerSmallRadian,
                              ),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                          ),
                          style: TextStyle(fontSize: textSize),
                        ),
                      ),
                      TextButton(
                        onPressed: _sendSMSCode,
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text("获取验证码"),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 100, bottom: 150),
                    child: ElevatedButton(
                      onPressed: _loginAccount,
                      child: Text("登录"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 40,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.keyboard_arrow_left, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
