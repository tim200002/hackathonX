import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'bloc/mainBloc.dart';
import 'home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/screens.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      title: 'tflite real-time detection',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(cameras),
    );*/

    return BlocProvider<MainBloc>(
        builder: (BuildContext context) => MainBloc(cameras: cameras),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Screens()));
  }
}
