import 'package:flutter/material.dart';
import 'package:projetos_estudos/components/task.dart';
import 'package:projetos_estudos/data/task_inherited.dart';
import 'package:projetos_estudos/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //parte de baixo, do fundo do app
      appBar: AppBar(
        leading: Container(),
        //parte de cima do app
        backgroundColor: Colors.blue,
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: ListView(
        children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(top:8, bottom: 70),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context,),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
