import 'package:flutter/material.dart';

class FirstContainer extends StatefulWidget {
  const FirstContainer({Key? key}) : super(key: key);

  @override
  _FirstContainerState createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? colorAnimation;
  Animation? sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(controller!);
    sizeAnimation =
        Tween<double>(begin: 100.0, end: 200.0).animate(controller!);
    controller!.addListener(() {
      setState(() {});
    });

    controller!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Demo"),
      ),
      body: Center(
        child: Container(
          height: sizeAnimation!.value,
          width: sizeAnimation!.value,
          color: colorAnimation!.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
