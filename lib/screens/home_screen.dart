import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:AksharaVidya/screens/pronunciation_screen.dart';
import 'package:AksharaVidya/screens/quiz_screen_copy.dart';
import 'package:AksharaVidya/screens/spelling_screen.dart';

class HomeScreen extends StatelessWidget {
  var arr = [QuizScreen3(), SpellingScreen(), PronunciationScreen()];

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        centerTitle: true,
        title: Text(
          "AksharaVidya",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Spline.png"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: makeItem(
                        i: 0,
                        image: 'assets/images/bg.jpg',
                        alpha: 'Dyslexia Detection',
                        context: context)),
                SizedBox(
                  height: 20,
                ),
                FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: makeItem(
                        i: 1,
                        image: 'assets/images/bg.jpg',
                        alpha: 'Spelling Exercises',
                        context: context)),
                SizedBox(
                  height: 20,
                ),
                FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: makeItem(
                        i: 2,
                        image: 'assets/images/bg.jpg',
                        alpha: 'Pronunciation Exercises',
                        context: context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeItem({i, image, alpha, context}) {
    return GestureDetector(
      onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => arr[i]));
        
      },
      child: Container(
        height: 180,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  offset: Offset(0, 10))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeInUp(
                          duration: Duration(milliseconds: 1000),
                          child: Text(
                            alpha,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
