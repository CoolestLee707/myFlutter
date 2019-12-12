import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {

  double _sliderItemA = 0.0;
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("CheckboxDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Slider(
                  value: _sliderItemA,
                  onChanged: (value){
                    setState(() {
                      _sliderItemA = value;
                    });
                  },
                  activeColor: Colors.red,
                  inactiveColor: Colors.green.withOpacity(0.3),
                  min: 0.0,
                  max: 100.0,
                  divisions: 10,//分割份数
                  label: '${_sliderItemA.toInt()}',//拖动时显示文字
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Text('$_sliderItemA')
          ],
        ),
      ),
    );
  }
}