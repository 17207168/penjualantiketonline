import 'package:flutter/material.dart';
import '../../model/penjualan.dart';
import 'data_penumpang.dart';

class DataItem extends StatelessWidget {
  final Tiket tiket;

  const DataItem({super.key, required this.tiket});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${tiket.Jenistiket}"),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DataDetail(tiket: tiket)));
      },
    );
  }
}
