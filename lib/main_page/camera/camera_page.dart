import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraApp extends StatefulWidget {
  CameraApp({required this.camera});

  late CameraDescription camera;

  @override
  _CameraAppState createState() => _CameraAppState(camera: camera);
}

class _CameraAppState extends State<CameraApp> {
  _CameraAppState({required this.camera});

  final CameraDescription camera;
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(camera, ResolutionPreset.max);
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
      debugShowCheckedModeBanner: false,
      home: CameraPreview(controller),
    );
  }
}
