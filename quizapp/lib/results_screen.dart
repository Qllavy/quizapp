import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';
// import 'package:quizapp/quiz.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chooseAnswer,
    required this.onRestart,
  });

  final List<String> chooseAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Udzieliłeś $numCorrectQuestions poprawne odpowiedzi na $numTotalQuestions pytań!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 30,
                color: const Color.fromARGB(255, 240, 237, 237),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            QuestionsSummary(summaryData),
            // TextButton(onPressed: () {}, child: const Text("Restart quiz")),
            const SizedBox(height: 15),
            OutlinedButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Restart quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
