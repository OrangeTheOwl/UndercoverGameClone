class Player {
  final String name;
  String? role; // 'citizen' or 'undercover'
  String? word;
  bool isEliminated;

  Player({required this.name, this.role, this.word, this.isEliminated = false});
}
