import "package:flutter/material.dart";
import "package:flutter_demo/screens/screenMain.dart";

class ScreenAlternative extends StatefulWidget {
  const ScreenAlternative({super.key});

  @override
  State<ScreenAlternative> createState() => _ScreenAlternativeState();
}

class _ScreenAlternativeState extends State<ScreenAlternative> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Guess game!',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red[100],
        elevation: 5,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('Variant ${_items[index]}'),
            leading: const Icon(Icons.ac_unit),
            trailing: const Icon(Icons.arrow_forward),
          ),
        )
      ),
    );
  }

  final List _items = ["Pink axolotl", "Blue axolotl", "Green axolotl", "Yellow axolotl", "Red axolotl", "Purple axolotl", "Black axolotl", "White axolotl", "Orange axolotl", "Brown axolotl"];

}
