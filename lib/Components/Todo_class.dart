class Todo {
  String task;             // Propriété pour le nom de la tâche
  bool taskCompleted;      // Propriété pour savoir si la tâche est terminée

  // Constructeur de la classe Todo
  Todo({
    required this.task,
    this.taskCompleted = false, // Par défaut, la tâche n'est pas terminée
  });

  // Méthode pour changer l'état de la tâche (complétée ou non)
  void onChange() {
    taskCompleted = !taskCompleted; // Inverse l'état de la tâche (true <-> false)
  }

  @override
  String toString() {
    return 'Tâche: $task, Complétée: ${taskCompleted ? "Oui" : "Non"}';
  }
}
