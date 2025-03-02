import 'package:flutter/material.dart';
import '../../../widgets/bla_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestBlaButtonScreen(),
    );
  }
}

class TestBlaButtonScreen extends StatelessWidget {
  const TestBlaButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Test Bla Button",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Primary Button without Icon
          BlaButton(
            label: "Messenger",
            isPrimary: true,
            hasIcon: false,
            onPressed: () {},
          ),
          const SizedBox(height: 16.0),
          // Primary button with icon
          BlaButton(
            label: "Messenger",
            isPrimary: true,
            hasIcon: true,
            icon: Icons.message,
            onPressed: () {},
          ),
          const SizedBox(height: 16.0),
          // Secondary button without icon
          BlaButton(
            label: "Messenger",
            isPrimary: false,
            hasIcon: false,
            onPressed: () {},
          ),
          const SizedBox(height: 16.0),
          // Secondary button with icon
          BlaButton(
            label: "Messenger",
            isPrimary: false,
            hasIcon: true,
            icon: Icons.message,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}