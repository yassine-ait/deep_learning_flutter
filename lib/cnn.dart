import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class cnn extends StatefulWidget {
  const cnn({super.key});

  @override
  _cnnState createState() => _cnnState();
}

class _cnnState extends State<cnn> {


   load_image(){


   }
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar:AppBar(title: const Text('CNN ALGORITHM'),
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor:Colors.blue,
        statusBarColor:Colors.blue
      ),
      ),
      body:
      Column(
        children:[
          Container(
            width:MediaQuery.of(context).size.width,
            height:300,
            color:Colors.grey

          ),

           Row(
             mainAxisAlignment:MainAxisAlignment.center,
             children: [
    ElevatedButton(onPressed: (){
      load_image();
    }, child: const Text('Load an image')),
    ElevatedButton(onPressed: (){}, child: const Text('Take a picture'))
    ],)
        ]


      )
,



    );
    
    
    
    
  }
}