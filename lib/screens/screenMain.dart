import 'package:flutter/material.dart';
import 'package:flutter_application_demo/providers/MainState.dart';
import 'package:flutter_application_demo/screens/screenAlternative.dart';
import 'package:provider/provider.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) {
    var mainState = context.watch<MainState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Guess game!',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red[100],
        elevation: 5,
        leading: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenAlternative(),
            ),
          ),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.asset(
                  'assets/images/descarga.jpg',
                  height: 200,
                ),
              ),
            ),
            const Text(
              'Guess a number from 1 to 100',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: TextField(
                enabled: true,
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter a number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Msg: ${mainState.message}',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Intentos: ${mainState.counter.toString()}',
                  style: TextStyle(
                    color: Colors.green[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _validate(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[300],
                    elevation: 10,
                  ),
                  child: const Text(
                    'Guess!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _retry(context);
        },
        tooltip: 'Retry',
        backgroundColor: Colors.red,
        child: const Icon(Icons.arrow_circle_left),
      ),
    );
  }

  final TextEditingController _controller = TextEditingController();

  void _validate(BuildContext context) {
    if (_controller.text.isEmpty || context.read<MainState>().winner) {
      return;
    }

    if (context.read<MainState>().number > int.parse(_controller.text)) {
      context.read<MainState>().message = "Number is greater";
      context.read<MainState>().counter++;
    } else if (context.read<MainState>().number < int.parse(_controller.text)) {
      context.read<MainState>().message = "Number is lesser";
      context.read<MainState>().counter++;
    } else {
      context.read<MainState>().message = "Number is equal";
      context.read<MainState>().winner = true;
    }
  }

  void _retry(BuildContext context) {
    if (context.read<MainState>().winner = true) {
      context.read<MainState>().message = "";
      context.read<MainState>().winner = false;
      context.read<MainState>().counter = 0;
    }
  }
}
