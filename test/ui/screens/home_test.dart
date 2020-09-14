import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flutter_apps/core/bloc/counter/bloc.dart';
import 'package:testing_flutter_apps/ui/screens/home.dart';

void main() {
  testWidgets('Should be able to render', (WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => CounterBloC(),
      child: MaterialApp(home: HomeScreen()),
    ));

    final Finder counterText = find.byKey(Key('counter'));

    expect(counterText, findsOneWidget);
  });

  testWidgets('Should be able to increment the counter',
      (WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => CounterBloC(),
      child: MaterialApp(home: HomeScreen()),
    ));

    final Finder incrementButton = find.byKey(Key('increment-counter'));

    await tester.tap(incrementButton);
    await tester.pumpAndSettle();

    final Finder counterText = find.text('Counter: 1');

    expect(counterText, findsOneWidget);
  });

  testWidgets('Should be able to decrement the counter',
      (WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => CounterBloC(),
      child: MaterialApp(home: HomeScreen()),
    ));

    final Finder incrementButton = find.byKey(Key('decrement-counter'));

    await tester.tap(incrementButton);
    await tester.pumpAndSettle();

    final Finder counterText = find.text('Counter: -1');

    expect(counterText, findsOneWidget);
  });

  testWidgets('Should be able to reset the counter',
      (WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => CounterBloC(),
      child: MaterialApp(home: HomeScreen()),
    ));

    final Finder incrementButton = find.byKey(Key('increment-counter'));
    final Finder resetButton = find.byKey(Key('reset-counter'));

    await tester.tap(incrementButton);
    await tester.tap(resetButton);
    await tester.pumpAndSettle();

    final Finder counterText = find.text('Counter: 0');

    expect(counterText, findsOneWidget);
  });
}
