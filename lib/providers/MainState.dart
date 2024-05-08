import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainState extends ChangeNotifier {
  String _message = "";
  int _counter = 0;
  bool _winner = false;
  int _number = 56;

  String get message => _message;
  int get counter => _counter;
  bool get winner => _winner;
  int get number => _number;

  set message(String message) {
    _message = message;
    notifyListeners();
  }

  set counter(int counter) {
    _counter = counter;
    notifyListeners();
  }

  set winner(bool winner) {
    _winner = winner;
    notifyListeners();
  }

  void newGame(BuildContext context) {
    context.read<MainState>().winner = false;
    context.read<MainState>().message = "";
    context.read<MainState>().counter = 0;
  }
}
