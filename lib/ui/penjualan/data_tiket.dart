import 'package:flutter/material.dart';
import 'package:klinik_app/model/penjualan.dart';
import 'package:klinik_app/service/data_service.dart';
import 'pesan_tiket.dart';
import 'data_item.dart';
import '../widget/sidebar.dart';

class DataTiket extends StatefulWidget {
  const DataTiket({Key? key}) : super(key: key);
  _DataTiketState createState() => _DataTiketState();
}

class _DataTiketState extends State<DataTiket> {
  Stream<List<Tiket>> getList() async* {
    List<Tiket> data = await DataService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Tiket"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PesanTiket()));
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: getList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Kosong');
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return DataItem(tiket: snapshot.data[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PesanTiket()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
