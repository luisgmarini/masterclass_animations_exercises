import 'package:flutter/material.dart';

class AnimacaoImplicitaPage extends StatefulWidget {
  const AnimacaoImplicitaPage({Key? key}) : super(key: key);

  @override
  State<AnimacaoImplicitaPage> createState() => _AnimacaoImplicitaPageState();
}

class _AnimacaoImplicitaPageState extends State<AnimacaoImplicitaPage> {

  final duration =  const Duration(seconds: 1);
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animação Implícita"),
      ),
      body: AnimatedAlign(
        alignment: isSelected ? Alignment.bottomRight : Alignment.topCenter,
        duration: duration,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: AnimatedContainer(
            margin: const EdgeInsets.all(20),
            width: isSelected ? 70 : 150,
            height: isSelected ? 70 : 60,
            alignment: isSelected ? Alignment.bottomRight : Alignment.topCenter,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: isSelected ? BorderRadius.circular(100) : BorderRadius.zero,
            ),
            duration: duration,
          ),
        ),
      ),
    );
  }
}
