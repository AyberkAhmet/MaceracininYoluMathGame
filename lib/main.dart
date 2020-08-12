import 'package:flutter/material.dart';
import 'package:math_app/screens/questionListPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(title: Text("Maceracının Yolu"),leading: Container(),centerTitle: true,),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return QuestionListPage();
            }));
          },
          child: Text("OYNA", style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
      ),
    );
  }
}
