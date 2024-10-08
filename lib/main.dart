import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart'; // Add this import
import 'package:path/path.dart'; // Add this import for file paths
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  double _brightness = 0.0;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _adjustBrightness(double value) {
    setState(() {
      _brightness = value;
    });
  }


Future<void> _saveImage() async {
  if (_image != null) {
    try {
      // Open a dialog box to select the save path
      String? path = await FilePicker.platform.getDirectoryPath();

      if (path != null) {
        final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
        final savePath = '$path/$fileName';

        // Copy the image file to the selected path
        await _image!.copy(savePath);
        print('Image saved to $savePath');
      } else {
        print('No path selected.');
      }
    } catch (e) {
      print('Error saving image: $e');
    }
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Image Picker Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _image == null
                  ? Text('No image selected.')
                  : ColorFiltered(
                      colorFilter: ColorFilter.matrix(<double>[
                        1, 0, 0, 0, _brightness * 255,
                        0, 1, 0, 0, _brightness * 255,
                        0, 0, 1, 0, _brightness * 255,
                        0, 0, 0, 1, 0,
                      ]),
                      child: Image.file(_image!),
                    ),
            ),
          ),
          Slider(
            value: _brightness,
            min: -1.0,
            max: 1.0,
            onChanged: _adjustBrightness,
            label: 'Brightness',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Take Picture'),
              ),
              ElevatedButton(
                onPressed: _saveImage,
                child: Text('Save Picture'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
