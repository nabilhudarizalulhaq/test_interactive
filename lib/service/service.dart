import 'package:dio/dio.dart';
import 'package:test_interactive/models/user_model.dart';

abstract class AddItem {
  Future<UserModel> addData(String nama, String noAkun) async {
    const api = 'http://interactive.co.id/myinterview/myinterview.php';
    final data = {
      "nama": nama,
      "no_akun": noAkun,
    };
    Response response;
    response = await Dio().post(api, data: data);
    if (response.statusCode == 200) {
      print(response.data);
      return UserModel(noAkun: noAkun, nama: nama);
    } else {
      return UserModel(noAkun: noAkun, nama: nama);
    }
  }
}
