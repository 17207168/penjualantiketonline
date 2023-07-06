import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klinik_app/model/penjualan.dart';
import 'package:klinik_app/service/data_service.dart';
import 'package:klinik_app/ui/penjualan/data_tiket.dart';

class DataUpdate extends StatefulWidget {
  final Tiket tiket;

  const DataUpdate({super.key, required this.tiket});

  @override
  State<DataUpdate> createState() => _DataUpdateState();
}

class _DataUpdateState extends State<DataUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _DariCtrl = TextEditingController();
  final _KeCtrl = TextEditingController();
  final _PenumpangCtrl = TextEditingController();
  final _JenisTiketCtrl = TextEditingController();
  TextEditingController datetimeinput = TextEditingController();

  Future<Tiket> getData() async {
    Tiket data = await DataService().getById(widget.tiket.id.toString());
    setState(() {
      _namaCtrl.text = data.nama;
      _DariCtrl.text = data.Dari;
      _KeCtrl.text = data.Ke;
      _PenumpangCtrl.text = data.Penumpang;
      _JenisTiketCtrl.text = data.Jenistiket;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Atur Jadwal")),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [_fieldAturJadwal(), _tombolSimpan()],
            ),
          ),
        ),
      ),
    );
  }

  _fieldAturJadwal() {
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

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Tiket pesawat = Tiket(
            nama: _namaCtrl.text,
            Dari: _DariCtrl.text,
            Ke: _KeCtrl.text,
            Berangkat: datetimeinput.text,
            Penumpang: _PenumpangCtrl.text,
            Jenistiket: _JenisTiketCtrl.text,
          );
          await DataService().ubah(pesawat, widget.tiket.id.toString()).then(
              (value) => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DataTiket())));
        },
        child: const Text("Simpan Perubahan"));
  }
}
