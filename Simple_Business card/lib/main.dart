import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CircleAvatar(
             radius: 50.0,
             backgroundImage:AssetImage("images/sathish.jpg") ,

           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Sathish",
                style: TextStyle(fontSize:20.0,
                    letterSpacing: 1.0,
                    color: Colors.white,
                  fontFamily: "Pacifico",
                    fontWeight: FontWeight.bold,

              )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("FLUTTER DEVELOPER",
                  style: TextStyle(fontSize:20.0,
                    letterSpacing: 1.0,
                    color: Colors.white,

                  )
              ),
            ),
            SizedBox(
              width: 170.0,
              child: Divider(height: 5.0,color: Colors.tealAccent,),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 35.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.phone,),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("8778537047",
                      style: TextStyle(

                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 35.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.email,),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("satsansathish1016@gmail.com",
                      style: TextStyle(

                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}
