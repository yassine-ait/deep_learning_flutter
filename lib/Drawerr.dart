import 'package:flutter/material.dart';

import 'ann.dart';
import 'cnn.dart';


class Drawerr extends StatelessWidget {
  const Drawerr({super.key});

  @override
  Widget build(BuildContext context) {

    return  Drawer(
      child: 
      ListView(
        children:[
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue,Colors.white,Colors.black])
            ),
            child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/ai.jpg'))),

            Column(
              children:[
                const ExpansionTile(title:Text('Home'),
                leading:Icon(Icons.home),
                children:[
                  ListTile(title:Text('Documentation'))
                ]),
                ExpansionTile(title:const Text('Classification Algorithm'),
                leading:const Icon(Icons.article),
                children:[
                  ListTile(
                  title:const Text('ANN'),
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const Ann()));
                  }),
                  ListTile(title:const Text('CNN'),
                   onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const Cnn()));
                  })
                ]),
              ]



            )
          

        ]



      )
    
    
    
    
    
    ,);
  }
}