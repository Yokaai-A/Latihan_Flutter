// Encapsulation 

class mobil {
  String? _merk;
  int? _tahun;

  // Constructor
  mobil(this._merk, this._tahun);

  // Getter 
  String? get namaMobil => _merk;

  void info() {
    print('Mobil $_merk, Tahun $_tahun');
  }
}