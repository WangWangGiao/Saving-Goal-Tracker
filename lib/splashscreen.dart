import 'package:flutter/material.dart';
import 'package:saving_goal_tracker/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SavingGoalCalculator()),
       );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 128, 238, 211),
              const Color.fromARGB(255, 52, 225, 185),
              const Color.fromARGB(255, 4, 137, 123),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: Image.asset('assets/business-goal.png'),
            ),
            SizedBox(height: 10),
            Text(
              "VAULTURE",
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.w800,
                color: const Color.fromARGB(201, 255, 255, 255),
                letterSpacing: 1.3,
                height: 1
              ),
            ),
            Text(
              "Discipline Creates Destiny",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 9, 69, 63),
                height: 1
                ),
            ),
            Spacer(),
            SizedBox(
              height: 5,
              width: 300,
              child: LinearProgressIndicator(
                color: Colors.teal,
                ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}