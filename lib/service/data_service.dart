import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/penjualan.dart';

class DataService {
  Future<List<Tiket>> listData() async {
    final Response response = await ApiClient().get('tiket');
    final List data = response.data as List;
    List<Tiket> result = data.map((json) => Tiket.fromJson(json)).toList();
    return result;
  }

  Future<Tiket> simpan(Tiket tiket) async {
    var data = tiket.toJson();
    final Response response = await ApiClient().post('tiket', data);
    Tiket result = Tiket.fromJson(response.data);
    return result;
  }

  Future<Tiket> ubah(Tiket tiket, String id) async {
    var data = tiket.toJson();
    final Response response = await ApiClient().put('tiket/${id}', data);
    print(response);
    Tiket result = Tiket.fromJson(response.data);
    return result;
  }

  Future<Tiket> getById(String id) async {
    final Response response = await ApiClient().get('tiket/${id}');
    Tiket result = Tiket.fromJson(response.data);
    return result;
  }

  Future<Tiket> hapus(Tiket tiket) async {
    final Response response = await ApiClient().delete('tiket/${tiket.id}');
    Tiket result = Tiket.fromJson(response.data);
    return result;
  }
}
