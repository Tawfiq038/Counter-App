// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:counter_app/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("You've pressed the button this many times:"),
              Text(
                value.count.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // get access to counter class
            final counter = context.read<CounterModel>();

            // increment
            counter.increment();
          },
          tooltip: "Increment",
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
