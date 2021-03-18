import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
        elevation: 0.0,
      ),
      // body: ThemeDemo(),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.green,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // TextFieldDemo(),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = 'hello';
    textEditingController.addListener(() {
      debugPrint('input:${textEditingController.text}');
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      // 用TextEditingController监听文本变化
      controller: textEditingController,

      // 输入文本发生变化回调方法
      // onChanged: (value) {
      //   debugPrint('input:$value');
      // },

      // 点击完成会收回键盘回调方法
      onSubmitted: (value) {
        debugPrint('submit:$value');
      },

      decoration: InputDecoration(
        icon: Icon(Icons.subject), //左侧图标
        labelText: 'Title', //标题
        hintText: 'Enter the post title', //placeHolder
        // border: InputBorder.none,//去掉底部边框
        // border: OutlineInputBorder()//四周设置边框
        filled: true, //输入框灰色背景
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFieldDemo();
  }
}

// -------------注册Form-----------------
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>(); //使用这个key去引用表单
  String username, password;
  bool autovalidate = false; //自动验证默认关闭

// 点击提交表单数据执行方法
  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      //验证成功
      registerFormKey.currentState.save();
      debugPrint('username:$username,password:$password');

      // 提示,底部弹出提示
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Registering....'),
      ));
    } else {
      // 验证失败,打开自动验证
      setState(() {
        autovalidate = true;
      });
    }

    // //这个方法会执行onSave的回调保存对应数据到对应变量,就可以打印出来
    // registerFormKey.currentState.save();

    // //执行检查作用，显示检查方法返回的字符串，显示在输入框下面，null就不显示
    // registerFormKey.currentState.validate();

    // debugPrint('username:$username,password:$password');
  }

// 判断输入信息是否符合规定，返回是字符串是显示在输入框下面的,null就不显示了
  String validateUsername(value) {
    if (value.isEmpty) {
      return 'username is required.';
    }

    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return 'password is required.';
    }
    return null;
  }

  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey, //使用这个key去引用表单
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: '', //错误信息出出现在这里，为了更自然不跳动加一个空的占一下位置
            ),

            //保存表单（registerFormKey.currentState.save()）会调用这个回调，
            onSaved: (value) {
              username = value;
            },

            //验证器-调用的方法
            validator: validateUsername,
            // 自动验证,这是必填的，没填就给提示，第一次看到也显示，可以设置动态打开，提交表单后再打开
            autovalidate: autovalidate,
          ),
          TextFormField(
            obscureText: true, //密文
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '', //错误信息出出现在这里，为了更自然不跳动加一个空的占一下位置
            ),
            onSaved: (value) {
              password = value;
            },

            validator: validatePassword,
            autovalidate: autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              elevation: 0.0,
              onPressed: submitRegisterForm, //点击提交表单数据执行方法
            ),
          )
        ],
      ),
    );
  }
}
