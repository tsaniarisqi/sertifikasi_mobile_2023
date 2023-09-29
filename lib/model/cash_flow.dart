class CashFlow {
  int? id;
  String? tgl;
  int? nominal;
  String? ket;
  String? jenis;

  CashFlow({this.id, this.tgl, this.nominal, this.ket, this.jenis});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['tgl'] = tgl;
    map['nominal'] = nominal;
    map['ket'] = ket;
    map['jenis'] = jenis;
    return map;
  }

  CashFlow.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    tgl = map['tgl'];
    nominal = map['nominal'];
    ket = map['ket'];
    jenis = map['jenis'];
  }
}
