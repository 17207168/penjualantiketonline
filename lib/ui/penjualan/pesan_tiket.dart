import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klinik_app/model/penjualan.dart';
import 'package:klinik_app/service/data_service.dart';
import 'package:klinik_app/ui/beranda.dart';

class PesanTiket extends StatefulWidget {
  const PesanTiket({super.key});

  @override
  State<PesanTiket> createState() => _PesanTiketState();
}

class _PesanTiketState extends State<PesanTiket> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _DariCtrl = TextEditingController();
  final _KeCtrl = TextEditingController();
  final _PenumpangCtrl = TextEditingController();
  final _JenistiketCtrl = TextEditingController();
  TextEditingController datetimeinput = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    datetimeinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pesan Tiket")),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldnama(),
                _fieldDari(),
                _fieldKe(),
                _fieldBerangkat(),
                _fieldPenumpang(),
                _fieldJenisTiket(),
                _tombolPesan()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _fieldnama() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama"),
      controller: _namaCtrl,
    );
  }

  _fieldDari() {
    return TextField(
      decoration: const InputDecoration(labelText: "Dari"),
      controller: _DariCtrl,
    );
  }

  _fieldKe() {
    return TextField(
      decoration: const InputDecoration(labelText: "Ke"),
      controller: _KeCtrl,
    );
  }

  _fieldBerangkat() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "Enter Date", icon: Icon(Icons.calendar_today)),
      controller: datetimeinput,
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100));
        if (pickedDate != null) {
          String formatDate =
              DateFormat("EEE, dd MMM , yyyy").format(pickedDate);
          setState(() {
            datetimeinput.text = formatDate;
          });
        } else {
          datetimeinput.text = "";
        }
      },
    );
  }

  _fieldPenumpang() {
    return TextField(
      decoration: const InputDecoration(labelText: "Penumpang"),
      controller: _PenumpangCtrl,
    );
  }

  _fieldJenisTiket() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tiket"),
      controller: _JenistiketCtrl,
    );
  }

  _tombolPesan() {
    return ElevatedButton(
        onPressed: () async {
          Tiket tiket = Tiket(
            nama: _namaCtrl.text,
            Dari: _DariCtrl.text,
            Ke: _KeCtrl.text,
            Berangkat: datetimeinput.text,
            Penumpang: _PenumpangCtrl.text,
            Jenistiket: _JenistiketCtrl.text,
          );
          await DataService().simpan(tiket).then((value) =>
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Beranda())));
        },
        child: const Text("Pesan"));
  }
}
