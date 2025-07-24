import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SizedBox(
      height: isLandscape ? 200 : 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final questionIndex = (data['question_index'] as int) + 1;
            final question = data['question'] as String;
            final userAnswer = data['user_answer'] as String;
            final correctAnswer = data['correct_answer'] as String;
            final isCorrect = userAnswer == correctAnswer;

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: isCorrect ? Colors.green : Colors.red,
                    child: Text(
                      questionIndex.toString(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Twoja odpowiedź: $userAnswer',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          'Poprawna odpowiedź: $correctAnswer',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.lightGreenAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
