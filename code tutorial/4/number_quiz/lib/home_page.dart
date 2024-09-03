import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String quiz = "";
  @override
  void initState() {
    super.initState();
    getQuiz();
  }

  void getQuiz() async {
    String trivil = await getNumberTrivia();
    setState(() {
      quiz = trivil;
    });
  }

  Future<String> getNumberTrivia() async {
    Response result = await Dio().get("http://numberapi.com/random/trivia");
    String trivia = result.data;
    print(trivia);
    return trivia;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.pinkAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    quiz,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    getQuiz();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  child: const Text("New Quiz"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
