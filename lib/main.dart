import 'package:flutter/material.dart';
import 'package:flutter_application_demo/providers/MainState.dart';
import 'package:flutter_application_demo/screens/screenAlternative.dart';
import 'package:flutter_application_demo/screens/screenMain.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MainState(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ScreenMain(),
        '/alternative': (context) => const ScreenAlternative(),
      },
    ),
  ));
}
