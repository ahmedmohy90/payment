import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payment/shared/style/colors.dart';

import '../../shared/component/constants.dart';

class RefCodeScreen extends StatelessWidget {
  const RefCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
 body:Center(
    child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
      const Text(
     
        'You Should Go to Any market to pay',
                
        style:TextStyle(fontSize:20,fontWeight:FontWeight.bold),
     ),// Text
     const  SizedBox(
        height:20,
     ),// SizedBox
     const Text(
        'This is Refrence Code',
        style:TextStyle(fontSize:15,fontWeight:FontWeight.bold),
    ),// Text
      Card(
        elevation:12.0,
        shape:Border.all(color:defaultColor,width:1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(Refcode, style:const TextStyle(fontSize:15,fontWeight:FontWeight.bold),),
        ),
      ),
    ]
    ),
 ),
);
}
}