class Player {
  String name;
  String? role; // 'citizen' or 'undercover'
  String? word;
  bool isEliminated;
  int votes;

  Player({
    required this.name,
    this.role,
    this.word,
    this.isEliminated = false,
    this.votes = 0,
  });
}
