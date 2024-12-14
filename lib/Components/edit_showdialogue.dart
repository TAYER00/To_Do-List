import 'package:flutter/material.dart';
  
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