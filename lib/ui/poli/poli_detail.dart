import 'package:flutter/material.dart';
import 'package:klinik_app/ui/poli/poli_page.dart';
import 'package:klinik_app/ui/poli/poli_update.dart';
import '../../model/Poli.dart';

class PoliDetailWidget extends StatefulWidget {
  final Poli poli;

  const PoliDetailWidget({super.key, required this.poli});

  @override
  State<PoliDetailWidget> createState() => _PoliDetailWidgetState();
}

class _PoliDetailWidgetState extends State<PoliDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poli Detail"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Nama Poli : ${widget.poli.namaPoli}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Kategori Poli : ${widget.poli.kategoriPoli}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_tombolUbah(), _tombolHapus()],
          )
        ],
      ),
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PoliUpdate(poli: widget.poli)));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: Text("Ubah"));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: Text("Hapus"));
  }
}
