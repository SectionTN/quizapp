import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/screens/quiz.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void _onPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Quiz()),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.deepPurple,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/quiz-logo.png'),
              width: 400,
              height: 300,
            ),
            const SizedBox(height: 35),
            const Text(
              "Learn flutter the fun way!",
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => _onPressed(context),
              child: const Text("Start Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
