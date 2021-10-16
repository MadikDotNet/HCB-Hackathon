import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Future<List<CameraDescription>> initializeCameras()async{
  return await availableCameras();
}

class CameraApp extends StatefulWidget {
  late List<CameraDescription> cameras;

  CameraApp(this.cameras);

  @override
  _CameraAppState createState() => _CameraAppState(cameras);
}

class _CameraAppState extends State<CameraApp> {
  late List<CameraDescription> cameras;

  _CameraAppState(this.cameras);
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: CameraPreview(controller),
    );
  }
}