import 'package:flutter/material.dart';
import 'package:klinik_app/model/Poli.dart';
import 'package:klinik_app/ui/poli/poli_detail.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _namaPoliCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Tambah Poli"),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            _fieldNamaPoli(),
            const SizedBox(
              height: 20,
            ),
            _tombolSimpan(),
          ],
        ),
      )),
    );
  }

  _fieldNamaPoli() {
    return TextField(
      decoration: InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Poli poli = Poli(namaPoli: _namaPoliCtrl.text, kategoriPoli: "Poli");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PoliDetailWidget(poli: poli)));
        },
        child: const Text("Simpan"));
  }
}
