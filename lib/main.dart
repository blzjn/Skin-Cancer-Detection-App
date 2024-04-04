import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skin Cancer Detection App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SkinCancerDetectionPage(),
    );
  }
}

class SkinCancerDetectionPage extends StatefulWidget {
  @override
  _SkinCancerDetectionPageState createState() =>
      _SkinCancerDetectionPageState();
}

class _SkinCancerDetectionPageState extends State<SkinCancerDetectionPage> {
  File? _image; // Marking as nullable explicitly
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skin Cancer Detection App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text(
                    'No image selected.',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  )
                : Image.file(
                    _image!,
                    height: 200,
                  ),
            SizedBox(height: 20),
            TextButton(
              onPressed: getImage,
              child: Text(
                'Upload Image',
              ),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15))

              // textColor: Colors.white,
              ,
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  // Placeholder for detection logic
                },
                child: Text(
                  'Detect Skin Cancer',
                ),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15))),
          ],
        ),
      ),
    );
  }
}
