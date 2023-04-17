class Pegawai {
  String? id;
  String nip;
  String nama;
  String tglLahir;
  String noTelp;
  String email;
  String password;

  Pegawai(
      {this.id,
      required this.nip,
      required this.nama,
      required this.tglLahir,
      required this.noTelp,
      required this.email,
      required this.password});
}
