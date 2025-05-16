// Inheritance 

class Motor {
  String? merkMotor;
  int? tahunKeluar;
  int? harga;

  Motor(this.merkMotor, this.tahunKeluar, this.harga);
}

class Motorcycle extends Motor {

  Motorcycle(String merkMotor, int tahunKeluar, int harga) : super(merkMotor, tahunKeluar, harga);

  void informasi() {
    print('Harga Motor $merkMotor, adalah $harga keluaran tahun $tahunKeluar');
  }
}