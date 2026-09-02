import 'dart:io';

class Grid {
  List<List<int>> grid = [];

  void readFromFile(String filename)
  {
    File file = File("test.txt");
    String contents = file.readAsStringSync();
    List<String> fileLines = contents.split('\n');

    for (String line in fileLines)
    {
      List<String> fileWords = line.split(' ');
      List<int> numberList = [];
      for (String word in fileWords)
      {
        int number = int.parse(word);
        numberList.add(number);
      }
      grid.add(numberList);
    }
    grid.removeAt(0);
  }

  int countThree()
  {
    int threeCount = 0;
    for (List<int> line in grid)
    {
      for (int num in line)
      {
        if (num == 3) threeCount++;
      }
    }
    return threeCount;
  }

  @override
  String toString()
  {
    String msg = '';

    for (List<int> numberList in grid)
    {
      msg += "$numberList\n";
    }

    return msg;
  }
}

void main() {
  Grid grid = Grid();
  grid.readFromFile("test.txt");
  print("Found ${grid.countThree()} 3s in csv.");
}