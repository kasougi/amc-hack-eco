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
      controller = CameraController(value[0], ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    if (controller == null) {
      return Container();
    }
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            child: CameraPreview(controller),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: -18,
                      blurRadius: 28,
                      color: Color(0x329C9C9C)
                  )
                ]
            ),
            child: TextButton(
              onPressed: (){Navigator.pushReplacementNamed(context, "/TicketPage");},
              child: Text("Сделать фото", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
            ),
          )
        )
      ],
    );
  }
}