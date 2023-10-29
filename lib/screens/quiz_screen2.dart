import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:AksharaVidya/widgets/answer_card%20copy.dart';

import '/models/questions copy.dart';
import '/screens/result_screen.dart';
import '/widgets/next_button.dart';

class QuizScreen2 extends StatefulWidget {
  const QuizScreen2({super.key});

  @override
  State<QuizScreen2> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen2> {
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
                'Guess the Spelling',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Text(
                question.question,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      final player = AudioPlayer();
                      player.play(AssetSource(question.options[index]));
                    },
                    onDoubleTap: selectedAnswerIndex == null
                        ? () => pickAnswer(index)
                        : null,
                    child: AnswerCard2(
                      currentIndex: index,
                      question: question.options2[index],
                      isSelected: selectedAnswerIndex == index,
                      selectedAnswerIndex: selectedAnswerIndex,
                      correctAnswerIndex: question.correctAnswerIndex,
                    ),
                  );
                  // Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         TextButton(
                  //           onPressed: () {
                  //             final player = AudioPlayer();
                  //             player.play(AssetSource(question.options[index]));
                  //           },
                  //           child: Icon(
                  //             Icons.play_circle,
                  //             color: Colors.white,
                  //             size: 65,
                  //           ),
                  //         ),
                  //         GestureDetector(
                  //           onTap: selectedAnswerIndex == null
                  //               ? () => pickAnswer(index)
                  //               : null,
                  //           child: AnswerCard(
                  //             currentIndex: index,
                  //             question: question.options[index],
                  //             isSelected: selectedAnswerIndex == index,
                  //             selectedAnswerIndex: selectedAnswerIndex,
                  //             correctAnswerIndex: question.correctAnswerIndex,
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: 20,
                  //     )
                  //   ],
                  // );
                },
              ),
              isLastQuestion
                  ? RectangularButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => ResultScreen(
                              score: score,
                            ),
                          ),
                        );
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
