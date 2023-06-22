import 'package:flutter/material.dart';
import 'package:klinik_app/helpers/user_info.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/ui/beranda.dart';
import 'package:klinik_app/ui/login.dart';
import 'package:klinik_app/ui/pasien/pasien_page.dart';
import 'package:klinik_app/ui/pegawai/pegawai_page.dart';
import 'package:klinik_app/ui/poli/poli_page.dart';

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
            leading: const Icon(Icons.accessible),
            title: const Text("Poli"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PoliPageWidget()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Pegawai"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PegawaiPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box_sharp),
            title: Text("Pasien"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PasienPageWidget()));
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
