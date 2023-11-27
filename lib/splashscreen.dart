
import 'dart:async';


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'MyHomePage.dart';




class Splashcreen extends StatefulWidget {


  @override
  State<Splashcreen> createState() => _SplashcreenState();
}

class _SplashcreenState extends State<Splashcreen> {
var timer;


start_timer(){

  timer=Timer(const Duration(seconds: 5),(){

    Navigator.push(context , MaterialPageRoute(builder: (context)=>const MyHomePage(title: 'AI APPLICATION')));
  });
}
@override
void initState() {
    start_timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Center(child:Lottie.network('https://lottie.host/7728b4f7-7b6d-4e5e-a61d-1c1a5651be8e/bTJNwbh8hd.json'), ) 
    );
  }
}