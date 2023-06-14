//export
export 'a.dart';

// abstract-extends-new
abstract class Phone {
  void info();
}

class Iphone extends Phone {
  void info() {
    print("8GB, ios 12");
  }
}

class Samsung extends Phone {
  void info() {
    print("4GB, lolipop");
  }
}

main() {
  Iphone iphone = new Iphone();
  Samsung samsung = new Samsung();

  iphone.info();
  samsung.info();

}
