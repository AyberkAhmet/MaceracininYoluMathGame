import 'package:flutter/material.dart';
import 'package:math_app/main.dart';
import 'package:math_app/screens/questionPage.dart';

class QuestionListPage extends StatefulWidget {
  @override
  _QuestionListPageState createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: Text("Maceracının Yolu"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return MyHomePage();
              }));
            }),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (BuildContext context, index) {
            return FlatButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return QuestionPage(index);
                }));
              },
              child: Text("Seviye " + (index+1).toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
            );
          },
        ),
      ),
    );
  }
}
