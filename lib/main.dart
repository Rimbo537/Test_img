import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_img/bloc/image_bloc.dart';
import 'package:test_img/data/image_repository.dart';
import 'package:test_img/main_screen.dart';
import 'package:test_img/model/image_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageBloc(
        imageRepo: ImagesRepository(),
      )..add(const LoadImage()),
      child:  MainScreen(),
    );
  }
}
