class Tiket {
  String? id;
  String nama;
  String Dari;
  String Ke;
  String Berangkat;
  String Penumpang;
  String Jenistiket;

  Tiket(
      {this.id,
      required this.nama,
      required this.Dari,
      required this.Ke,
      required this.Berangkat,
      required this.Penumpang,
      required this.Jenistiket});

  factory Tiket.fromJson(Map<String, dynamic> json) => Tiket(
      id: json["id"],
      nama: json["nama"],
      Dari: json["Dari"],
      Ke: json["Ke"],
      Berangkat: json["Berangkat"],
      Penumpang: json["Penumpang"],
      Jenistiket: json["Jenistiket"]);

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "Dari": Dari,
        "Ke": Ke,
        "Berangkat": Berangkat,
        "Penumpang": Penumpang,
        "Jenistiket": Jenistiket
      };
}
