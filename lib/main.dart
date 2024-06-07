import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double width = 0;
  double height = 0;
  Color color = Colors.transparent;

  double generateRandomNumber() {
    final random = Random();
    int min = 50;
    int max = 200;
    int rand = random.nextInt(max) + min;
    return rand.toDouble();
  }

  Color generateRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void _change() {
    setState(() {
      width = generateRandomNumber();
      height = generateRandomNumber();
      color = generateRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MyWidget(width, height, color),
      floatingActionButton: TextButton(
        child: Text("Mudar quadrado"),
        onPressed: () => {_change()},
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  const MyWidget(this.width, this.height, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(color: color, width: width, height: height));
  }
}
