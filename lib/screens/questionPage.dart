import 'package:flutter/material.dart';
import 'package:math_app/main.dart';
import 'package:math_app/models/questions.dart';

class QuestionPage extends StatefulWidget {
  final int levelIndex;
  QuestionPage(this.levelIndex);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  static Questions _questions;
  List<int> _shuffledNumbers;
  List<String> _takenAnswers;
  int counter;
  int controlCounter;
  String viewText;
  bool isAnswerCorrect;

  @override
  void initState() {
    super.initState();
    print(widget.levelIndex);
    _questions = getQuestion(widget.levelIndex);
    _shuffledNumbers = _questions.numbers;
    _shuffledNumbers.shuffle();
    _takenAnswers = [];
    for (var i = 0; i < _shuffledNumbers.length; i++) {
      _takenAnswers.add("X");
    }
    counter = 0;
    controlCounter = 0;
    viewText = "";
    isAnswerCorrect = false;
  }

  _control() {
    String winText =
        "Tebrikler, düşmanı yendin,maceraya devam etmek için ilerle";
    String loseText = "Başaramadın, düşmanın sorusunu düşün ve tekrar dene";
    String winChildText = "İlerle";
    String loseChildText = "Tekrar Dene";
    
    for (var j = 0; j < _questions.answer.length; j++) {
      for (var i = 0; i < _takenAnswers.length; i++) {
        if (_questions.answer[j][i].toString() == _takenAnswers[i]) {
          controlCounter++;
        }
      }
      if (_questions.answer[j].length == controlCounter) {
        isAnswerCorrect = true;
        break;
      }
      controlCounter = 0;
    }
    if (widget.levelIndex + 1 == 9 && isAnswerCorrect) {
      return showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              content: Text(
                  "Tebrikler, tüm düşmanların sorularını doğru cevaplayıp prensesin hapsolduğu yere geldin ve prensesi kurtardın."),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MyHomePage();
                    }));
                  },
                  child: Text("Son"),
                )
              ],
            );
          });
    }
    if (isAnswerCorrect) {
      print("tebrikler");
      _createAlertDialog(context, winText, widget.levelIndex + 1, winChildText);
    } else {
      print("tekrar dene");
      _createAlertDialog(context, loseText, widget.levelIndex, loseChildText);
    }
  }

  _createAlertDialog(
      BuildContext context, String text, int levelIndex, String childText) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return QuestionPage(levelIndex);
                  }));
                },
                child: Text(childText),
              )
            ],
          );
        });
  }

  _createViewText() {
    int totalLenght = _questions.operations.length + _takenAnswers.length;
    int opCounter = 0;
    int answerCounter = 0;
    for (var i = 0; i < totalLenght; i++) {
      if (i % 2 == 1) {
        viewText += _questions.operations[opCounter].toString();
        opCounter++;
      } else if (i % 2 == 0) {
        viewText += _takenAnswers[answerCounter].toString();
        answerCounter++;
      }
    }
    viewText += " = ";
    viewText += _questions.conclusion.toString();

    return Text(
      viewText,
      style: TextStyle(color: Colors.black, fontSize: 20),
    );
  }

  _createButtonList(int buttonCount) {
    var button;
    List<Widget> buttonList = [];
    for (var i = 0; i < buttonCount; i++) {
      button = Expanded(
        flex: 1,
        child: Container(
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.deepOrange)),
            color: Colors.deepOrange,
            onPressed: () {
              setState(() {
                _takenAnswers[counter] = _shuffledNumbers[i].toString();
                _shuffledNumbers.removeAt(i);
                counter++;
                if (counter == _questions.answer[0].length) {
                  _control();
                }
                viewText = "";
              });
            },
            child: Text(_shuffledNumbers[i].toString()),
          ),
        ),
      );
      buttonList.add(button);
    }
    return buttonList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return MyHomePage();
              }));
            }),
        title: Text("Maceracının Yolu"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                    )),
                    height: 70,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child:
                              Image.asset("assets/backgrounds/background1.png"),
                        ),
                        Positioned(
                          child:
                              Image.asset("assets/characters/Adventurer.png"),
                          bottom: 5,
                        ),
                        Positioned(
                          child: Image.asset(
                            "assets/enemies/wizard.png",
                            height: 35,
                            width: 35,
                          ),
                          bottom: 5,
                          right: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(5),
                      child: Text("Yolkesen:" +
                          " Selam maceracı, buradan geçebilmek için sorduğum bu matematik sorusunu cevaplaman gerekiyor. Soracağım sorunun içindeki X harfleri yerine doğru sayıları koyarak sonuca ulaşman gerekiyor. Sana soracağım soru şöyle:"),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        alignment: Alignment.center,
                        height: 100,
                        width: 300,
                        child: _createViewText(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 300,
                  child: Row(
                    children: _createButtonList(_shuffledNumbers.length),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
