import 'package:flutter/material.dart';
import 'package:projetos_estudos/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

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

      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: [
            const Task(
                'Aprender Flutter',
                'assets/images/Flutter.png',
                5),
            const Task(
                'Andar de bike',
                'assets/images/bike.jpeg',
                3),
            const Task(
                'Meditar',
                'assets/images/meditar.jpeg',
                4),
            const Task(
                'Ler',
                'assets/images/ler.jpg',
                2),
            const Task('Jogar',
                'assets/images/jogar.jpg',
                1),
            SizedBox(height: 80)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
