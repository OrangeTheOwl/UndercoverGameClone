import 'dart:math';

List<List<String>> wordPairs = [
  ['Cat', 'Tiger'],
  ['Coffee', 'Tea'],
  ['Ship', 'Boat'],
];

List<String> getRandomWordPair() {
  final random = Random();
  return wordPairs[random.nextInt(wordPairs.length)];
}
