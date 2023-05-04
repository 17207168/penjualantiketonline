import 'package:flutter/material.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/ui/pegawai/pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _keyForm = GlobalKey<FormState>();
  final _nipTextboxCtr = TextEditingController();
  final _namaTextboxCtr = TextEditingController();
  final _tglLahirTextboxCtr = TextEditingController();
  final _noTelpTextboxCtr = TextEditingController();
  final _emailTextboxCtr = TextEditingController();
  final _passwordTextboxCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Form Tambah Pegawai"),
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: SingleChildScrollView(
              child: Form(
                key: _keyForm,
                child: Column(
                  children: [
                    _nipTextfield(),
                    _namaTextfield(),
                    _tglLahirTextfield(),
                    _noTelpTextfield(),
                    _emailTextfield(),
                    _passwordTextfield(),
                    const SizedBox(
                      height: 20,
                    ),
                    _tombolSimpan()
                  ],
                ),
              ),
            )));
  }

  _nipTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "NIP"),
      controller: _nipTextboxCtr,
    );
  }

  _namaTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Nama"),
      controller: _namaTextboxCtr,
    );
  }

  _tglLahirTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Tanggal Lahir"),
      controller: _tglLahirTextboxCtr,
    );
  }

  _noTelpTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "No Telpon"),
      controller: _noTelpTextboxCtr,
    );
  }

  _emailTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Email"),
      controller: _emailTextboxCtr,
    );
  }

  _passwordTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Password"),
      obscureText: true,
      controller: _passwordTextboxCtr,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Pegawai pegawai = Pegawai(
              nip: _nipTextboxCtr.text,
              nama: _namaTextboxCtr.text,
              tglLahir: _tglLahirTextboxCtr.text,
              noTelp: _noTelpTextboxCtr.text,
              email: _emailTextboxCtr.text,
              password: _passwordTextboxCtr.text);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai: pegawai)));
        },
        child: const Text("Simpan"));
  }
}
