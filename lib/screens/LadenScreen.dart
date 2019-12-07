import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import '../camera.dart';
import '../bndbox.dart';
import '../models.dart';

class LadenScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  LadenScreen(this.cameras);
  @override
  _LadenScreenState createState() => _LadenScreenState();
}

class _LadenScreenState extends State<LadenScreen> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  @override
  void initState() {
    super.initState();
  }

  //Load Model in Tfliite
  loadModel() async {
    String res;

    res = await Tflite.loadModel(
      model: "assets/ssd_mobilenet.tflite",
      labels: "assets/ssd_mobilenet.txt",
    );
    print(res);
  }

//Helper function
  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

//Sets all Recognitions for Bounding Boxes
  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Get Size to show Stream Fullscreen
    Size screen = MediaQuery.of(context).size;
    //Loads Model
    onSelect(ssd);
    return Scaffold(
      appBar: AppBar(
        title: Text("im Laden"),
      ),
      body: _model == "" //While model isn't loaded progess Bar
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                Camera(
                  widget.cameras,
                  _model,
                  setRecognitions,
                ),
                BndBox(
                    _recognitions == null ? [] : _recognitions,
                    math.max(_imageHeight, _imageWidth),
                    math.min(_imageHeight, _imageWidth),
                    screen.height,
                    screen.width,
                    _model),
              ],
            ),
    );
  }
}
