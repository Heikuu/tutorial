// (a) palindrome

void main() {
  int reminder, sum = 0, temp;
  int number = 54545;

  temp = number;

  // a loop to reverse a number
  while (number > 0) {
    reminder = number % 10; //get remainder
    sum = (sum * 10) + reminder;
    number = number ~/ 10;
  }

  if (sum == temp) {
    print('Its A Palindrome number');
  } else {
    print('Its A Not Palindrome number');
  }

// (b) leap year

  var year = 2019;
  if (year % 4 == 0) {
    if (year % 100 == 0) {
      if (year % 400 == 0) {
        print(" $year, is  a leap year");
      } else {
        print(" $year, is not a leap year");
      }
    } else {
      print(" $year, is  a leap year");
    }
  } else {
    print(" $year, is not a leap year");
  }

  // (c) removing element from array

  List l = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  print('The value of list before removing the list element ${l}');
  bool res = l.remove(1);
  print('The value of list after removing the list element ${l}');

  // (d) swapping element from array

  List<String> example = ['a', 'b', 'c'];
  for (int i = 0; i < example.length; i++) {
    if (example[i] == 'b') {
      final temp = example[0];
      example[0] = example[i];
      example[i] = temp;
    }
  }

  print(example);
}
