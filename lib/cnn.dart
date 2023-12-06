/*import 'dart:io'; // Import this for File class
//import 'dart:js_interop';
//import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Cnn extends StatefulWidget {
  const Cnn({Key? key}) : super(key: key);

  @override
  _CnnState createState() => _CnnState();
}

class _CnnState extends State<Cnn> {
  List? _outputs;
  File? _image;
  bool imageSelect = false;

  @override
  void initState() {
    super.initState();
    loadmodel();
  }

  loadmodel() async {
    Tflite.close();
    String res = (await Tflite.loadModel(
      model: "assets/model.tflite",
    ))!;
    print("Models loading status: $res");
  }

  rec(File image) async {
    
    final List? recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 1, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );
    setState(() {
      _outputs = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile; // Change XFile to File

  Future<void> _pickImage(ImageSource source) async {
    XFile? pickedImage = await _picker.pickImage(source: source);
    File image = File(pickedImage!.path);
    if (image == null) {
      print("image not loaded");
      return;
    }
    rec(image);
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
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
            Image.file(
              File(_imageFile!.path),
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
          /*ElevatedButton(
            onPressed: () {
            },
            child: const Text('Predict'),
          )*/
          ElevatedButton(
  onPressed: () async {
    // Perform the prediction if an image is selected
    if (_image != null) {
      await rec(_image!);
      
      // Show the result in a button
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Prediction Result'),
          content: _outputs != null
              ? Text('Predicted Class: ${_outputs![0]['label']}')
              : const Text('No prediction result available'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Show an alert if no image is selected
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please load an image first.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  },
  child: const Text('Predict'),
)
        ],
      ),
    );
  }
}*/
import 'dart:io'; // Import this for File class
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Cnn extends StatefulWidget {
  const Cnn({Key? key}) : super(key: key);

  @override
  _CnnState createState() => _CnnState();
}

class _CnnState extends State<Cnn> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile; // Change XFile to File

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
            Image.file(
              File(_imageFile!.path),
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
            onPressed: () {rec(_imageFile!);},
            child: const Text('Predict'),
          )
        ],
      ),
    );
  }

  rec(XFile image) async {
    final List? recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 1, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );
    // setState(() {
    //   _outputs = recognitions!;
    //   _image = image;
    //   imageSelect = true;
    // });
    print(recognitions);
  }

  Future<void> _pickImage(ImageSource source) async {
    XFile? pickedImage = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedImage; // Change XFile to File
    });
  }

    @override
  void initState() {
    super.initState();
    loadmodel();
  }

  loadmodel() async {
    Tflite.close();
    String res = (await Tflite.loadModel(
      model: "assets/model.tflite",
    ))!;
    print("Models loading status: $res"); 
  }
}



