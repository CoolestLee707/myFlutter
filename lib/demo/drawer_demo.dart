import 'package:flutter/material.dart';
import 'package:myflutter/demo/state/state_management_demo.dart';
import 'package:myflutter/demo/stream/stream_demo.dart';
import 'package:myflutter/demo/stream/stream_controller_demo.dart';

class drawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 83.0),
        children: <Widget>[
          // DrawerHeader(
          //   child: Text('header'.toUpperCase(),style: TextStyle(fontSize: 30.0,color: Colors.yellow),),
          //   decoration: BoxDecoration(
          //     color: Colors.black,
          //   ),
          // ),

          UserAccountsDrawerHeader(
            accountName: Text('ChuanminLee',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            accountEmail: Text(
              'Emile',
              style: TextStyle(color: Colors.yellow),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://pic22.nipic.com/20120620/9644879_220135570113_2.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.red, //背景颜色
              image: DecorationImage(
                image: NetworkImage(
                    'http://pic27.nipic.com/20130324/9252150_174233406000_2.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black,
                  BlendMode.src,
                ),
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.system_update),
            title: Text(
              'first select',
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.system_update,
              color: Colors.red,
              size: 30.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text(
              'secoond select',
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.supervised_user_circle,
              color: Colors.green,
              size: 30.0,
            ),
            onLongPress: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.settings_system_daydream),
            title: Text(
              'state_management',
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.settings_system_daydream,
              color: Colors.blue,
              size: 30.0,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/state-management');
            },
          ),
          ListTile(
            leading: Icon(Icons.wallpaper),
            title: Text(
              'state-scopedModel',
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.radio,
              color: Colors.black,
              size: 30.0,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/state-scopedModel');
            },
          ),
          ListTile(
            leading: Icon(Icons.offline_bolt),
            title: Text(
              'stream',
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.offline_bolt,
              color: Colors.blueGrey,
              size: 30.0,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/stream');
            },
          ),
          ListTile(
            leading: Icon(Icons.unarchive),
            title: Text(
              'stream_controller',
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.unarchive,
              color: Colors.purple,
              size: 30.0,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/streamController');
            },
          ),
          ListTile(
            leading: Icon(Icons.query_builder),
            title: Text(
              'bloc',
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.query_builder,
              color: Colors.green,
              size: 30.0,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/bloc');
            },
          ),
          ListTile(
            leading: Icon(Icons.warning),
            title: Text(
              'http',
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.warning,
              color: Colors.lightBlue,
              size: 30.0,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/http');
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              'animation',
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30.0,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/animation');
            },
          ),
        ],
      ),
    );
  }
}
