class FeriadoEntity {
  String? name;
  String? date;

  FeriadoEntity({this.name, this.date});

  static FeriadoEntity fromJson(Map<String, dynamic> map) {
    return FeriadoEntity(name: map['name'], date: map['date']);
  }
}
