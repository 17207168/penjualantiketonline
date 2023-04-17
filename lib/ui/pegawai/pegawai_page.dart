import 'package:flutter/material.dart';
import '../../model/pegawai.dart';
import 'pegawai_item.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pegawai"),
      ),
      body: ListView(
        children: [
          PegawaiItem(
            pegawai: Pegawai(
                nip: "1234123",
                nama: "iqbal",
                tglLahir: "1999-01-01",
                noTelp: "085939458",
                email: "slamet@gmai.com",
                password: "Slametmet"),
          ),
          PegawaiItem(
            pegawai: Pegawai(
                nip: "1234123",
                nama: "Dimas",
                tglLahir: "2003-01-01",
                noTelp: "085932323",
                email: "dimas@gmai.com",
                password: "dimas2met"),
          ),
        ],
      ),
    );
  }
}
