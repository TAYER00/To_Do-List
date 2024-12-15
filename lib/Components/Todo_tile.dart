import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; // Importer le package Slidable
import 'package:mitch_ko/Components/Todo_class.dart';

// Assurez-vous que votre modèle Todo est bien importé
class TodoListTile extends StatelessWidget {
  
  final Todo todo;
  final VoidCallback onDelete; // Callback pour la suppression
  final VoidCallback onEdit;

  const TodoListTile({
    Key? key,
    required this.todo,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: ValueKey(todo),
        // Panneau d'action de début (gauche)
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => onEdit(),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.archive,
              label: 'Archive',
            ),
          ],
        ),
        // Panneau d'action de fin (droite)
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) =>
                  onDelete(), // Appel de la méthode de suppression
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),


        child: Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: const Color.fromARGB(255, 225, 237, 13),


          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            leading: Checkbox(
              value: todo.taskCompleted,
              onChanged: (bool? value) {
                // Mettre à jour l'état de la tâche
                todo.onChange();

                (context as Element).markNeedsBuild();
              },
              activeColor: Colors.blue,
              checkColor: Colors.white,
            ),
            title: Text(
              todo.task,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: todo.taskCompleted ? Colors.grey : Colors.black,
                decoration: todo.taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: Icon(
              Icons.check_circle_outline,
              color: todo.taskCompleted ? Colors.green : Colors.transparent,
            ),
          ),
        ));
  }
}
