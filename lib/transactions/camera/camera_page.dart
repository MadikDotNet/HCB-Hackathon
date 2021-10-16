import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CameraPageState();

}

class _CameraPageState extends State<CameraPage> {

  File? imageFile;

  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 50,),
          imageFile != null ?
          Container(
            child: Image.file(imageFile!),
          ) :
          Container(
            child: Icon(
                Icons.camera_enhance_rounded,
                color: Colors.green,
                size: MediaQuery.of(context).size.width * .6
            ),
          ),

          Padding(padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              child: Text('Image'),
              onPressed: () {
                _getFromCamera();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))
              ),
            ),
          )
        ],
      ),
    );
  }

}
