import 'package:flutter/material.dart';
import 'package:klinik_app/model/poli.dart';
import 'package:klinik_app/ui/poli/poli_detail.dart';

class PoliUpdate extends StatefulWidget {
  final Poli poli;

  const PoliUpdate({super.key, required this.poli});

  @override
  State<PoliUpdate> createState() => _PoliUpdateState();
}

class _PoliUpdateState extends State<PoliUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _namaPoliCtrl.text = widget.poli.namaPoli;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Ubah Poli")),
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
        child: const Text("Simpan Perubahan"));
  }
}
