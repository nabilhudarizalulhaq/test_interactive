import 'package:dio/dio.dart';
import 'package:test_interactive/models/user_model.dart';
import 'package:test_interactive/service/service.dart';

class AddController extends AddItem {
  @override
  Future<UserModel> addData(String nama, String noAkun) async {
    const api = 'http://interactive.co.id/myinterview/myinterview.php';
    final data = {
      "nama": nama,
      "no_akun": noAkun,
    };

    try {
      Response response = await Dio().post(api, data: data);
      print(response.data);
      
      if (response.statusCode == 200) {
        return UserModel(noAkun: noAkun, nama: nama);
      } else {
        throw Exception('Gagal menambahkan data');
      }
    } catch (error) {
      throw Exception('Gagal menambahkan data');
    }
  }
}
