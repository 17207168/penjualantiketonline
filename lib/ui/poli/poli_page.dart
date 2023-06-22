import 'package:flutter/material.dart';
import 'package:klinik_app/model/poli.dart';
import 'package:klinik_app/ui/poli/poli_detail.dart';
import 'package:klinik_app/ui/poli/poli_form.dart';
import 'poli_item.dart';

class PoliPageWidget extends StatefulWidget {
  const PoliPageWidget({super.key});

  @override
  State<PoliPageWidget> createState() => _PoliPageWidgetState();
}

class _PoliPageWidgetState extends State<PoliPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Poli"),
      ),
      body: ListView(
        children: [
          PoliItem(
            poli: Poli(namaPoli: "Poli Anak"),
          ),
          PoliItem(
            poli: Poli(namaPoli: "Poli Kandungan"),
          ),
          PoliItem(
            poli: Poli(namaPoli: "Poli Gigi"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PoliForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
