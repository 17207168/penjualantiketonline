import 'package:flutter/material.dart';
import 'package:klinik_app/ui/penjualan/data_tiket.dart';
import 'package:klinik_app/ui/penjualan/pesan_tiket.dart';
import 'package:klinik_app/ui/widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MENU UTAMA"),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.green[100],
        drawer: Sidebar(),
        body: Container(
            padding: EdgeInsets.all(30.0),
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PesanTiket()));
                    },
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.airplanemode_active,
                            size: 70.0,
                          ),
                          Text(
                            "Pesawat",
                            style: new TextStyle(fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PesanTiket()));
                    },
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.directions_railway,
                            size: 70.0,
                          ),
                          Text(
                            "Kereta",
                            style: new TextStyle(fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PesanTiket()));
                    },
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.directions_bus,
                            size: 70.0,
                          ),
                          Text(
                            "BUS",
                            style: new TextStyle(fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DataTiket()));
                    },
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.book,
                            size: 70.0,
                          ),
                          Text(
                            "History Pesanan",
                            style: new TextStyle(fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PesanTiket()));
                    },
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.logout,
                            size: 70.0,
                          ),
                          Text(
                            "Logout",
                            style: new TextStyle(fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
