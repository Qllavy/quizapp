import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: isLandscape ? 150 : 300,
            color: const Color.fromARGB(125, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset('assets/images/quiz-logo.png', width: 300),
          // ),
          SizedBox(height: isLandscape ? 40 : 80),
          Text(
            'Kliknij aby rozpocząć!',
            style: GoogleFonts.lato(
              fontSize: 30,
              color: const Color.fromARGB(255, 240, 237, 237),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Rozpocznij QUIZ!"),
          ),
        ],
      ),
    );
  }
}
