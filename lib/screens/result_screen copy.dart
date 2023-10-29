import 'package:flutter/material.dart';

import '/models/questions copy 2.dart';

class ResultScreen2 extends StatelessWidget {
  
  const ResultScreen2({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 1000),
              const Text(
                'Your Score: ',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                children: [
                  Text(
                    score.toString(),
                    style: const TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${(score / questions.length)}',
                    style: const TextStyle(fontSize: 25),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
