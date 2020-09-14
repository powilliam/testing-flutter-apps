import 'package:flutter/material.dart';
import 'package:testing_flutter_apps/ui/screens/home.dart';

class TestingFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Testing Flutter Apps',
        theme: ThemeData(
            primaryColor: Colors.blueAccent, accentColor: Colors.blueAccent),
        home: HomeScreen(),
      );
}
