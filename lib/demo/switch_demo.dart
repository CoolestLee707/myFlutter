import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {

  bool _switchItemA = false;
  bool _switchItemB = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SwitchDemo"),
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
                Text(_switchItemA ? '😀' : '😢',style: TextStyle(fontSize: 35.0),),
                Switch(
                  value: _switchItemA,
                  onChanged: (value){
                    setState(() {
                      _switchItemA = value;
                    });
                  },
                  activeColor: Colors.red,
                )
              ],
            ),

            SwitchListTile(
              value: _switchItemB,
              title: Text('SwitchItemB'),
              subtitle: Text('Description'),
              activeColor: Colors.red,
              secondary: Icon(_switchItemB ? Icons.visibility : Icons.visibility_off),
              onChanged: (value){
                setState(() {
                   _switchItemB = value;
                });
              },
              selected: _switchItemB,
            )
          ],
        ),
      ),
    );
  }
}
