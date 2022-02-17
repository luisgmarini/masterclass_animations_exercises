import 'dart:math';

import 'package:flutter/material.dart';

class AnimacaoControladaPage extends StatefulWidget {
  const AnimacaoControladaPage({Key? key}) : super(key: key);

  @override
  _AnimacaoControladaPageState createState() => _AnimacaoControladaPageState();
}

class ExpandedItem {
  final AnimationController controller;
  final Animation<double> heightFactorAnimation;
  final Animation<double> rotateAnimation;

  ExpandedItem({
    required this.controller,
    required this.heightFactorAnimation,
    required this.rotateAnimation,
  });
}

class _AnimacaoControladaPageState extends State<AnimacaoControladaPage>
    with TickerProviderStateMixin {
  static const String content =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel condimentum eros. Sed non ligula rhoncus, eleifend ante non, congue urna. Sed sed nisi vitae mi ullamcorper interdum. Pellentesque scelerisque ornare justo ac dictum. Fusce molestie erat id rhoncus consectetur. Nullam eu fermentum odio. Aliquam tristique Sed ultrices, ipsum id fermentum cursus, leo eros im";

  late AnimationController controller;
  late Animation<double> _heightFactorAnimation;
  late Animation<double> _rotateAnimation;

  List<ExpandedItem> item = [];

  @override
  void initState() {
    super.initState();

    item.addAll(List.generate(51, (index) {
      controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      );
      _heightFactorAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        controller,
      );
      _rotateAnimation = Tween<double>(begin: 0.0, end: pi).animate(
        controller,
      );

      return ExpandedItem(
        controller: controller,
        heightFactorAnimation: _heightFactorAnimation,
        rotateAnimation: _rotateAnimation,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animação Controlada"),
      ),
      body: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: item[index].controller,
              builder: (context, child) {
                return Column(
                  children: [
                    ListTile(
                      title: Text("My Expansion Tile $index"),
                      trailing: Transform.rotate(
                        angle: item[index].rotateAnimation.value,
                        child: const Icon(Icons.expand_more),
                      ),
                      onTap: () {
                        setState(() {
                          if (item[index].controller.value == 0) {
                            item[index].controller.forward();
                          } else {
                            item[index].controller.reverse();
                          }
                        });
                      },
                    ),
                    ClipRect(
                      child: Align(
                        heightFactor: item[index].heightFactorAnimation.value,
                        child: Column(children: const [
                          FlutterLogo(
                            size: 60,
                          ),
                          Text(
                            content,
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
