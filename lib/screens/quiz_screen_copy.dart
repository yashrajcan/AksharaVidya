import 'package:AksharaVidya/mlapi.dart';
import 'package:AksharaVidya/models/questions copy 2.dart';
import 'package:AksharaVidya/screens/result_screen%20copy.dart';
import 'package:AksharaVidya/widgets/answer_card%20copy%202.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/widgets/next_button.dart';

class QuizScreen3 extends StatefulWidget {
  const QuizScreen3({super.key});

  @override
  State<QuizScreen3> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen3> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                question.question,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: question.options.length,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 100,
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(question.options[index]),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ));
                    }),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: question.options2.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: selectedAnswerIndex == null
                        ? () => pickAnswer(index)
                        : null,
                    child: AnswerCard3(
                      currentIndex: index,
                      question: question.options2[index],
                      isSelected: selectedAnswerIndex == index,
                      selectedAnswerIndex: selectedAnswerIndex,
                      correctAnswerIndex: question.correctAnswerIndex,
                    ),
                  );
                },
              ),
              isLastQuestion
                  ? RectangularButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => ResultScreen2(
                              score: score,
                            ),
                          ),
                        );
                        // Float ans = (score  / questions.length) as Float;
                        int ans = 2;
                        Provider.of<mlapi>(context, listen: false)
                            .post(ans, ans, ans, ans, ans, ans);
                      },
                      label: 'Finish',
                    )
                  : RectangularButton(
                      onPressed:
                          selectedAnswerIndex != null ? goToNextQuestion : null,
                      label: 'Next',
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
