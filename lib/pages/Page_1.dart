import 'package:flutter/material.dart';
import 'package:mitch_ko/Components/Todo_class.dart';
import 'package:mitch_ko/Components/Todo_tile.dart';
import 'package:mitch_ko/Components/alert_Dialogue.dart';
import 'package:mitch_ko/pages/Page_2.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

List<Todo> todos = [
  Todo(task: "Faire les courses"),
  Todo(task: "Terminer le projet Flutter"),
  Todo(task: "Lire un livre"),
];

class _Page1State extends State<Page1> {
  void _addNewTask() async {
    String? newTask = await showAddTaskDialog(context);
    if (newTask != null && newTask.isNotEmpty) {
      setState(() {
        todos.add(Todo(task: newTask));
      });
    }
  }

  void onDelete(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  // Fonction pour éditer une tâche
  void _editTask(int index) async {
    String? updatedTask = await _showEditTaskDialog(context, todos[index].task);
    if (updatedTask != null && updatedTask.isNotEmpty) {
      setState(() {
        todos[index] = Todo(task: updatedTask); // Met à jour la tâche à l'index
      });
    }
  }

  // Afficher la boîte de dialogue d'édition
  Future<String?> _showEditTaskDialog(BuildContext context, String currentTask) {
    TextEditingController controller = TextEditingController(text: currentTask);

    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Modifier la tâche'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Entrez la nouvelle tâche'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Annuler l'édition
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, controller.text); // Retourner la nouvelle tâche
              },
              child: const Text('Valider'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 233, 111),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 230, 0),
        title: Center(child: Text("To Do" ,)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTask,
        child: Icon(Icons.plus_one),
      ),
      body: Column(
        children: [
          // Bouton pour naviguer vers la Page 2
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Page2()),
          //       );
          //     },
          //     child: Text("Aller à la Page 2"),
          //   ),
          // ),
          // Liste des tâches
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoListTile(
                  todo: todos[index],
                  onDelete: () => onDelete(index),
                  onEdit: () => _editTask(index), // Appeler la fonction _editTask
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
