import 'package:flutter/material.dart';
import 'package:projetos_estudos/data/task_inherited.dart';
//import 'package:projetos_estudos/screens/form_screen.dart';
import 'package:projetos_estudos/screens/initial_sreen.dart';
//import 'package:projetos_estudos/screens/initial_sreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}




