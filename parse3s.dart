import 'dart:io';

void main() {
  File textFile = File("test.txt");
  String contents = textFile.readAsStringSync();

  int threeCount = 0;
  for (int i = 0; i < contents.length; i++)
  {
    if (contents[i] == '3') threeCount++;
  }

  print("Text file has $threeCount 3s.");
}