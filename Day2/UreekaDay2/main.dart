import 'Car.dart';
import 'Motorcycle.dart';
import 'animals.dart';

void main() {
  mobil a = mobil('Suzuki', 1997);
  a.info();

  print(a.namaMobil);

  print("\n");
  //---------------------------------//

  Motorcycle motor = Motorcycle('Honda', 1999, 30000000);
  motor.informasi();

  print("\n");
  //---------------------------------//

  animal pertama = cats();
  pertama.speak();
  animal kedua = dogs();
  kedua.speak();
  animal ketiga = cow();
  ketiga.speak();
}