// Simple Polymorphism with abstraction 

abstract class animal {
  void speak();
}

class cats extends animal {

  @override

  void speak() {
    print('Miawwww!!');
  }

}

class dogs extends animal {

  @override

  void speak() {
    print('wooffff');
  }
  
}

class cow extends animal {

  @override

  void speak() {
    print('MOooooOOoOO');
  }
  
}