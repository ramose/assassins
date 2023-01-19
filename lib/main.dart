import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  CounterCubit mycounter = CounterCubit(initialData: 0);

  // Stream<int> countStream() async* {
  //   for (int i = 1; i < 10; i++) {
  //     await Future.delayed(const Duration(seconds: 1));
  //     yield i;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream App!"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(padding: const EdgeInsets.all(20), child: Text('${mycounter.current}', style: const TextStyle(fontSize: 40),),),
          BlocConsumer<CounterCubit, int>(
            bloc: mycounter,
            builder: (context, state) {
              return Column(
                children: [
                  Center(
                    child: Text(
                      "$state",
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                ],
              );
            },
            listener: ((context, state) {
              // print(state);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Dijalankan")));
            }),
            listenWhen: (previous, current) {
              if (current == 10) {
                return true;
              } else {
                return false;
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    mycounter.kurangData();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    mycounter.tambahData();
                  },
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
