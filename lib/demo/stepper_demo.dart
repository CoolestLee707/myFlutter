import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StepperDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ),
              child: Stepper(
                currentStep: _currentStep, //设置当前步骤

                //点击序号索引值会执行的方法，让他激活当前的step
                onStepTapped: (int value) {
                  setState(() {
                    _currentStep = value;
                  });
                },

                // 点击继续按钮
                onStepContinue: () {
                  setState(() {
                    _currentStep <= 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                //点击取消按钮
                onStepCancel: () {
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  });
                },
                steps: [
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Ligin first'),
                    content: Text(
                        'Incididunt ad ad sunt veniam aliqua Lorem aliqua anim irure.'),
                    isActive: _currentStep == 0, //是否激活
                  ),
                  Step(
                    title: Text('Choose Plan'),
                    subtitle: Text('Choose Your Plan'),
                    content: Text(
                        'Incididunt ad ad sunt veniam aliqua Lorem aliqua anim irure.'),
                    isActive: _currentStep == 1, //是否激活
                  ),
                  Step(
                    title: Text('Confirm payment'),
                    subtitle: Text('Confirm your payment method'),
                    content: Text(
                        'Incididunt ad ad sunt veniam aliqua Lorem aliqua anim irure.'),
                    isActive: _currentStep == 2, //是否激活
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
