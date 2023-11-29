
import 'dart:io'; // Import this for File class
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Cnn extends StatefulWidget {
  const Cnn({Key? key}) : super(key: key);

  @override
  _CnnState createState() => _CnnState();
}

class _CnnState extends State<Cnn> {
 
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile; // Change XFile to File

  Future<void> _pickImage(ImageSource source) async {
    XFile? pickedImage = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedImage; // Change XFile to File
    });
  }

  void _predict() {
    // Implement your prediction logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CNN ALGORITHM'),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.blue,
          statusBarColor: Colors.blue,
        ),
      ),
      body: Column(
        children: [
          if (_imageFile != null)
            Image.file( File(_imageFile!.path),
              width: MediaQuery.of(context).size.width,
              height: 300,
              fit: BoxFit.cover,
            )
          else
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.grey,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                },
                child: const Text('Load an image'),
              ),
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.camera);
                },
                child: const Text('Take a picture'),
              ),
            ],
          ),
           ElevatedButton(
                onPressed: () {
                },
                child: const Text('Predict'),
              )
        ],
      ),
    );
  }
}
