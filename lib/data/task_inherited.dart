import 'package:flutter/material.dart';
import 'package:projetos_estudos/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
  Task('Aprender Flutter', 'assets/images/Flutter.png', 5),
  Task('Andar de bike', 'assets/images/bike.jpeg', 3),
  Task('Meditar', 'assets/images/meditar.jpeg', 4),
  Task('Ler', 'assets/images/ler.jpg', 2),
  Task('Jogar', 'assets/images/jogar.jpg', 1),
  ];

  void newTask(String name, String photo, int difficulty){
  taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) { //fica de olho no estado anterior das tarefas
    return oldWidget.taskList.length != taskList.length; //verifica se o tamanho de lista é diferente do atual
  }
}
