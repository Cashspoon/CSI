import 'dart:io';

void main() {
  File textFile = File("test.csv");
  String contents = textFile.readAsStringSync();
  List<String> fileLines = contents.split('\n');

  for (String line in fileLines)
  {
    int parsedNumber = int.parse(line);
    print("Number is $parsedNumber");
  }
}