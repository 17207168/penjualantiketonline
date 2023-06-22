import 'package:flutter/material.dart';
import 'package:klinik_app/model/poli.dart';
import 'package:klinik_app/ui/poli/poli_detail.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Tambah Poli")),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [_fieldNamaPoli(), _tombolSimpan()],
            ),
          ),
        ),
      ),
    );
  }

  _fieldNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PoliDetailWidget(poli: poli)));
        },
        child: const Text("Submit"));
  }
}
