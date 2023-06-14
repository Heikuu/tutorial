// extension-show-hide-import-libraries-yield
import 'dart:math';
import 'a.dart' show Iphone;
import 'a.dart' hide Samsung;

// Variables
String name = "John Doe";
int age = 16;
int a = 1;
int b = 2;
int c = 2;

// function
int style()
{
  int obj;
  return obj=1;
}

// rethrow
void misbehave() {
  try {
    dynamic foo = true;
    print(foo++);
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow;
  }
}

// typedef
typedef Compare = int Function(Object a, Object b);
 
class SortedCollection {
 
 Compare compare;
 SortedCollection(this.compare);
 
}
 int sort(Object a, Object b) => 0;
 
// set
class Rectangle {
 
 double left, top, width, height;
 
 Rectangle(this.left, this.top, this.width, this.height);
 
 double get right => left + width;
 set right(double value) => left = value - width;
 
 double get bottom => top + height;
 set bottom(double value) => top = value - height;
}

// return
int callFunction(var p){
   return p + 10;
}

// super
class Supertext {
    String text = "Long time no see..";
}
class Subtext extends Supertext {
    void printInfo()
    {
        print(super.text);
    }
}

// this
class ThisDemo {
  int age= 4;
  ThisDemo(int age) {
    this.age = age;
  }
}

// throw
void g(int h) {
  if (h < 0) {
    throw new FormatException();
  }
}

// mixin-with
mixin Books {
  bool java = false;
  bool c = false;
  bool python = false;
 
  void Bookstore() {
    if (java) {
      print('I have Java');
    } else if (c) {
      print('I have C');
    } else {
      print('I have Dart');
    }
  }
}
class Subbooks with Books
{
  int n = 5;
}

<<<<<<< HEAD
// typeofDef

typedef KeyNumber(int a, int b);

FirstKey(int a, int b) {
  print("First Key");
  print("$a and $b are first keys");
}

SecondKey(int a, int b) {
  print("Second Key");
  print("$a and $b are second keys");
}

=======
>>>>>>> 34483c0531dc18befe6d95e4f0ee556f7d3cea68
// void
void main() {
  
// var
var num = 0; 
var count = 0; 
int d ;
int tryCatch = 10;

var p = 10;
var q = callFunction(p);
print(q);

Subbooks ob=new Subbooks();
ob.Bookstore();

SortedCollection coll = SortedCollection(sort);
assert(coll.compare is Function);
assert(coll.compare is Compare);

Subtext text = new Subtext();
text.printInfo();

ThisDemo td = new ThisDemo(10);
print(td.age);

<<<<<<< HEAD
// typeDef
KeyNumber number = FirstKey;
number(1,2);

number = SecondKey;
number(3,4);

=======
>>>>>>> 34483c0531dc18befe6d95e4f0ee556f7d3cea68
// null
var z;
print(z);
print(style());

try {
  misbehave();
} catch (e) {
  print('main() finished handling ${e.runtimeType}.');
}

var rect = Rectangle(3, 4, 20, 15);
assert(rect.left == 3);
rect.right = 12;
assert(rect.left == -8);

// throw-try
try {
  g(-2);
} catch (e) {
  print('Exception caught!');
}

// in
var lists = [1, 2, 3];
for (var obj in lists) print(obj);

// false
var index = false;
print(index);

// true
var indexx = true;
print(indexx);

// if-else
int num1 = 30;
int num2 = 10;

if(num1 == 30) {
  print("Num1 is 30");
}else {
  print("Num1 is 10");
}
// dynamic
dynamic x=1;

print(x);

x="xx";
print(x);

// do-while
int i=1; 
  do{ 
      print(i); 
        i++; 
  }while(i<=5); 

// sync
Iterable<int> naturalsTo(int n) sync* {

int k = 0;
while (k < n) yield k++;
}

// assert

String name = "John Doe";
  assert(name != "John Doe");
  print("not John Doe");

// switch-case-break-default
  String grade = "B";

  switch (grade) {
    case "A": print("Excellent");
    break;

    case "B": print("Good");
    break;

    default: print("Invalid Grade!");
  }
   
  //  try-catch-finally
try{
    var tryCatch2 = tryCatch ~/ 0;
    print(tryCatch2);
}
catch(e){
    print(e);
}
finally {
    print("TryCatch sample");
}

// on
try
  {
    int x=10,y;
    y=x~/0;
  }
  on IntegerDivisionByZeroException
  {
    print("divide by zero exception");
  }

// continue   
   for(num = 0;num<=20;num++) { 
      if (num % 2==0) { 
         continue; 
      } 
      count++; 
   } 
   print(" The count of odd values between 0 and 20 is: ${count}"); 

  print(name);
  print(age);
  print(age == 15);

// operators  

  print(a + b);
  print(a - b);
  print(a * b);
  print(a % b);
  print(++a);
  print(--b);

  print(a != b);
  print(a > b);
  print(a < b);
  print(a >= b);
  print(b <= c);

  print(b > a && c > a);
  print(a > b || c > a);
  print(!(a == 1));

  print(d = a+b);
  print(d += a);
  print(d -= b);
  print(d *= b);
  print(d %= a);
  print(d <<= 3);
  print(d <<= 3);
  print(d &= 2);
  print(d ^= 2);
  print(d != 2);

  print("Square root of 36 is: ${sqrt(36)}");

int s = 1;
int t = 2;

void panel() {
  print(s + t);
}

var username = "Bob";
const weight = 16;

}
