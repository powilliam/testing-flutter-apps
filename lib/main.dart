import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_flutter_apps/core/bloc/counter/bloc.dart';
import 'package:testing_flutter_apps/ui/app.dart';

void main() => runApp(BlocProvider(
    create: (context) => CounterBloC(), child: TestingFlutterApp()));
