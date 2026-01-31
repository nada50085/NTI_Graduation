import 'package:task7/screens/home.dart';
import 'package:flutter/material.dart';
class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
@override
State<BottomBar> createState() => MyAppState();

}

class MyAppState extends State<BottomBar> {

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Center(
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color:  const Color.fromARGB(255, 162, 171, 251),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(Icons.home_rounded,
                    color: Color.fromARGB(255, 5, 29, 72), size: 28),
              ),
              SizedBox(width: 35),
              IconButton(
                onPressed: () {  },
                icon: Icon(Icons.person,
                    color: Color.fromARGB(255, 5, 29, 72), size: 28),
              ),
              SizedBox(width: 35),
              IconButton(
                onPressed: () { },
                icon: Icon(Icons.settings,
                    color: Color.fromARGB(255, 5, 29, 72), size: 28),
              ),
            ],
          ),
        ),
      ),
    )
  
    ;
  }

}
