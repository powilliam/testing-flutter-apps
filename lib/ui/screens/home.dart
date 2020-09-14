import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_flutter_apps/core/bloc/counter/bloc.dart';
import 'package:testing_flutter_apps/core/bloc/counter/event.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  void _handleIncrementCounter(BuildContext context) {
    BlocProvider.of<CounterBloC>(context).add(CounterIncremented());
  }

  void _handleDecrementCounter(BuildContext context) {
    BlocProvider.of<CounterBloC>(context).add(CounterDecremented());
  }

  void _handleResetCounter(BuildContext context) {
    BlocProvider.of<CounterBloC>(context).add(CounterResets());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                key: Key('reset-counter'),
                tooltip: 'Reset the counter',
                icon: Icon(Icons.clear_all),
                onPressed: () => _handleResetCounter(context))
          ],
        ),
        body: SafeArea(
          child: Center(
            child: BlocBuilder<CounterBloC, int>(
              builder: (context, state) => Text(
                'Counter: $state',
                key: Key('counter'),
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
                key: Key('increment-counter'),
                tooltip: 'Increment the counter',
                child: Icon(Icons.add),
                onPressed: () => _handleIncrementCounter(context)),
            SizedBox(height: 8),
            FloatingActionButton(
                key: Key('decrement-counter'),
                tooltip: 'Decrement the counter',
                child: Icon(Icons.remove),
                onPressed: () => _handleDecrementCounter(context)),
          ],
        ),
      );
}
