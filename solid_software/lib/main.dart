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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Solid Software test task'),
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
  late Color _color;
  late Color _textColor;

  @override
  void initState() {
    super.initState();
    _color = Colors.white;
    _textColor = Colors.black;
  }

  void generateRandomColor() {
    Random random = Random();
    int r = random.nextInt(256);
    int g = random.nextInt(256);
    int b = random.nextInt(256);

    setState(() {
      _color = Color.fromARGB(255, r, g, b);
    });
  }

  _getTextColor(Color backgroundColor) {
    const threshold = 180;
    final averageColor =
        (backgroundColor.red + backgroundColor.green + backgroundColor.blue) ~/
            3;

    setState(() {
      _textColor = averageColor > threshold ? Colors.black : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(
          widget.title,
          style: TextStyle( fontSize: 22,
                  color: _textColor,
                  fontWeight: FontWeight.w500),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          generateRandomColor();
          _getTextColor(_color);
        },
        child: AnimatedContainer(
          duration:
              const Duration(milliseconds: 150),
          color: _color,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello there',
                  style: TextStyle(
                      fontSize: 18,
                      color: _textColor,
                      fontWeight: FontWeight.w600),
                ),
                 Text(
                  'tap on the Container)',
                  style: TextStyle(
                      fontSize: 15,
                      color: _textColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
