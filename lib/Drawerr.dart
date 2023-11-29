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
                ExpansionTile(title:Text('Classification Algorithm'),
                leading:Icon(Icons.article),
                children:[
                  ListTile(
                  title:Text('ANN'),
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const Ann()));
                  }),
                  ListTile(title:Text('CNN'),
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