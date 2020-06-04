import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:one_night/city_list.dart';
import 'package:one_night/constants.dart';
import 'package:one_night/location.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(new MediaQuery(
        data: new MediaQueryData.fromWindow(ui.window),
        child: new Directionality(
            textDirection: TextDirection.rtl,
            child: new MaterialApp(
              home: MyApp(),
              theme: ThemeData(fontFamily: PRIMARY_FONT),
              debugShowCheckedModeBanner: false))));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ()async{ 
      await Permission.location.request();
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => CityList()));
      });
    }();
    return Scaffold(
      body: Container(
        color: BG_COLOR,
        child: Center(
          child: Text(APP_NAME.toUpperCase(), 
            style: TextStyle(
              fontSize: 42, 
              color: Colors.yellow,
            ),
          ),
        ),
      ),
    );
  }
}

Future<PermissionStatus> requestPermission(Permission permission) async {
  return await permission.request();
}
