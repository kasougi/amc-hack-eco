import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {

  State<StatefulWidget> createState() => _CameraPage();
}

class _CameraPage extends State<CameraPage> with SingleTickerProviderStateMixin {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) {
      controller = CameraController(
          value.firstWhere(
              (camera) => camera.lensDirection == CameraLensDirection.front),
          ResolutionPreset.high);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: CameraPreview(controller)),
    );
  }
}