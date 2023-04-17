import 'package:flutter/material.dart';
import '../../model/Poli.dart';
import 'poli_detail.dart';

class PoliItem extends StatelessWidget {
  final Poli poli;

  const PoliItem({super.key, required this.poli});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(
            poli.namaPoli,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PoliDetailWidget(poli: poli)));
      },
    );
  }
}
