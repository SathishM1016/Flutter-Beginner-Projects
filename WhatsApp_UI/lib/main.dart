import 'package:flutter/material.dart';
import '';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:ThemeData(
      primaryColor: Color(0xff075e54),
      accentColor: Color(0xff25d366),
    ),
    home:MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex:1)
      ..addListener(() {
        setState(() {

        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        actions: [
          IconButton(onPressed: () {},
            icon: Icon(Icons.search),),
          IconButton(onPressed: () {},
            icon: Icon(Icons.more_vert),)
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt),),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
        floatingActionButton:_tabController.index==0? FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.camera_alt,color: Colors.white,)
        )
            :_tabController.index==1?FloatingActionButton(onPressed: (){},
            child: Icon(Icons.message_rounded,color: Colors.white,),
            )
            :_tabController.index==2?FloatingActionButton(onPressed: (){},
          child: Icon(Icons.edit,color: Colors.white,),)
            :FloatingActionButton(onPressed: (){},
          child: Icon(Icons.add_ic_call_sharp,color: Colors.white,),)

    );
  }
}
