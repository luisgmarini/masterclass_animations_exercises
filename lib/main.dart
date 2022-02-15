import 'package:flutter/material.dart';
import 'package:flutter_playground/pages/animations/anima%C3%A7%C3%B5es_controladas.dart';
import 'package:flutter_playground/pages/animations/anima%C3%A7%C3%B5es_impl%C3%ADcitas.dart';
import 'package:flutter_playground/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Playground'),
      routes:  {
        '/animacao_implicita' : (context) => const AnimacaoImplicitaPage(),
        '/animacao_controlada' : (context) => const AnimacaoControladaPage(),
      },
    );
  }
}


