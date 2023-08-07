import 'package:cubit_example/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Example',
      home: BlocProvider(
        create: (context) => ColorCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorCubit cubit = context.read<ColorCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Example'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorCubit, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            height: 100,
            width: 100,
            color: currentColor,
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              cubit.changeColor(ColorEvent.red);
            },
            backgroundColor: Colors.red,
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              cubit.changeColor(ColorEvent.green);
            },
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}