import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(
              child: Text(
            "This is Home Page",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ))
        ],
      ),
    );
  }
}
