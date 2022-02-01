import 'package:flutter/material.dart';
import 'package:animated_page_transition/animated_page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Page Transition',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageTransitionButton(
          vsync: this,
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFFF9735),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          nextPage: const SecondScreen(),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTransitionReceiver(
      scaffold: const Scaffold(
        backgroundColor: Color(0xFFFF9735),
      ),
    );
  }
}
