import 'package:flutter/material.dart';
import 'package:klinik_app/helpers/user_info.dart';
import 'package:klinik_app/ui/beranda.dart';
import 'package:klinik_app/ui/login.dart';
import 'package:klinik_app/ui/penjualan/data_tiket.dart';
import 'package:klinik_app/ui/penjualan/pesan_tiket.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              accountName: Text("Admin"), accountEmail: Text("Admin@mail.com")),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.airplanemode_active),
            title: const Text("Pesawat"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PesanTiket()));
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_railway),
            title: Text("Kereta"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PesanTiket()));
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_bus),
            title: Text("Bus"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PesanTiket()));
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("History Pesanan"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DataTiket()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Keluar"),
            onTap: () {
              UserInfo().logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
