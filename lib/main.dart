import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

File imageFile;

  _openGallery(BuildContext context) async{

    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);

    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();

  }

  _openCamera(BuildContext context) async{

    var campicture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
      imageFile = campicture;
    });
    Navigator.of(context).pop();

  }

  Future<void>  _showAlertDialogue(BuildContext context)
  {
    return showDialog(
      context: context,
      builder: (BuildContext context)
      {

        return AlertDialog(
          title: Text("Choose  an Option"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[

                GestureDetector(
                  child: Text("Open Gallery"),
                  onTap: (){
                    _openGallery(context);
                  },
                ),

                Padding(padding: EdgeInsets.all(10),),

                GestureDetector(
                  child: Text('Open Camera'),
                  onTap: (){
                    _openCamera(context);

                  },
                )


              ],
            ),
          ),

        );

      });

  }

  Widget _showImageFile(){
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Image Picker App'),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              (imageFile ==null) ? Text("No image Selected"): Image.file(imageFile, width:400, height:400),

             
              Padding(
                padding: EdgeInsets.all(10),
              ),
              RaisedButton(
                onPressed: (){

                  _showAlertDialogue(context);

                },
                child: Text("Choose Image"),
              )

            ],
          ),
        ),
      ),
      
    );
  }
}

