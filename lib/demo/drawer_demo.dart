import 'package:flutter/material.dart';

class drawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              // DrawerHeader(
              //   child: Text('header'.toUpperCase(),style: TextStyle(fontSize: 30.0,color: Colors.black38),),
              //   decoration: BoxDecoration(
              //     color: Colors.lightGreen,
              //   ),
              // ),

              UserAccountsDrawerHeader(
                accountName: Text('ChuanminLee',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.green)),
                accountEmail: Text('Emile',style: TextStyle(color: Colors.black),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('http://pic22.nipic.com/20120620/9644879_220135570113_2.jpg'),
                ),
                decoration: BoxDecoration(
                  color: Colors.red[200],//背景颜色
                  image: DecorationImage(
                    image: NetworkImage('http://pic27.nipic.com/20130324/9252150_174233406000_2.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.yellow[100], 
                      BlendMode.src,
                      ),
                  ),
                ),
              ),
                
              ListTile(
                leading: Icon(Icons.system_update),
                title: Text('first select',textAlign: TextAlign.center,),
                trailing: Icon(Icons.file_download,color: Colors.red,size: 30.0,),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle),
                title: Text('secoond select',textAlign: TextAlign.center,),
                trailing: Icon(Icons.file_upload,color: Colors.red,size: 30.0,),
                onLongPress: () => Navigator.pop(context),
              ),
            ],
          ),
        );
  }
}