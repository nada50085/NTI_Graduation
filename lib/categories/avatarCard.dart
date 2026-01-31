// ignore: file_names
import 'package:flutter/material.dart';

class AvatarCard extends StatefulWidget {
  const AvatarCard({super.key});
@override
State<AvatarCard> createState() => MyAppState();

}

class MyAppState extends State<AvatarCard> {

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CircleAvatar(
                        radius: 40,
                        backgroundImage: 
                        AssetImage("assets/Screenshot 2025-12-09 193723.png",),
                        child: Text(" "),
                                 ),
                                 SizedBox(width: 10,),
      ],
    )
                             ;
  }

}
