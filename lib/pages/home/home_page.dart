import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/animacao_implicita');
              },
              child: const Text("Animação Implícita"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/animacao_controlada');
              },
              child: const Text("Animação Controlada"),
            ),
          ),
        ],
      ),
    );
  }
}