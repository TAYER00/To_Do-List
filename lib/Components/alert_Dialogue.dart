import 'package:flutter/material.dart';

// Fonction pour afficher le dialogue
Future<String?> showAddTaskDialog(BuildContext context) {
  TextEditingController taskController = TextEditingController();
  bool isError = false;

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text('Ajouter une tâche'),
        content: TextField(
          controller: taskController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Entrez votre tâche...',
            border: OutlineInputBorder(),
            // Affichage de l'erreur si isError est vrai
            errorText: isError ? 'Le champ ne peut pas être vide' : null,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(
                  context); // Fermer la boîte de dialogue sans faire de changements
            },
            child: Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              String newTask = taskController.text.trim();
              if (newTask.isNotEmpty) {
                Navigator.pop(
                    context, newTask); // Fermer et renvoyer la nouvelle tâche
              } else {
                // Afficher l'erreur et ne pas fermer le dialogue
                isError = true;
                // Redessiner l'interface pour afficher l'erreur
                (context as Element).markNeedsBuild();
              }
            },
            child: Text('Valider'),
          ),
        ],
      );
    },
  );
}
