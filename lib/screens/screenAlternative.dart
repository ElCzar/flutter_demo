import "package:flutter/material.dart";

class ScreenAlternative extends StatefulWidget {
  const ScreenAlternative({super.key});

  @override
  State<ScreenAlternative> createState() => _ScreenAlternativeState();
}

class _ScreenAlternativeState extends State<ScreenAlternative> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Other screen'),
          Text('Is alternative'),
        ],
      ),
    );
  }
}
