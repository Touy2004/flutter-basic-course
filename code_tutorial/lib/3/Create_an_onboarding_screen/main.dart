import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
void main() async {
// Required to use async in the main() function
  WidgetsFlutterBinding.ensureInitialized();
// Create shared_preferences instance
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isOnBoarded = prefs.getBool('isOnBoarded') ?? false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.getTextTheme('Yeon Sung'),
      ),
      home: isOnBoarded ? const HomePage() : const OnBoardingPage(),
      // home: const OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Fast development",
            body: "Flutter's hot reload is easy and helps build UI.",
            // image: Padding(
            //   padding: const EdgeInsets.all(32),
            //   child: Image.network(
            //       'https://userimages.githubusercontent.com/26322627/143761841-ba5c8fa6-af01-4740-81b8-b8ff23d40253.png'),
            // ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ), // Second

          PageViewModel(
            title: "Expressive and flexible UI",
            body:
                "Delight your users with beautiful widgets built into Flutter.",
            // image: Image.network(
            //     'https://userimages.githubusercontent.com/26322627/143762620-8cc627ce-62b5-426b-bc81-a8f578e8549c.png'),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
        onDone: () {
          prefs.setBool("isOnBoarded", true);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        next: const Text("Next"),
        done: const Text("done"),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(
              onPressed: () {
                prefs.clear();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
