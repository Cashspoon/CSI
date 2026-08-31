import 'dart:io';

void main() {
  File textFile = File("test.csv");
  String contents = textFile.readAsStringSync();
  List<String> fileLines = contents.split('\n');

  int threeCount = 0;
  for (String line in fileLines)
  {
    List<String> fileWords = line.split('\n');
    for (String word in fileWords)
    {
      int number = int.parse(word);
      if (number == 3) threeCount++;
    }
  }

  print("Found $threeCount 3s in csv.");
}