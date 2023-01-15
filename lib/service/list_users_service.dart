import 'package:dio/dio.dart';
import '../model/list_users_model.dart';

class ListUsersService {
  Dio dio = Dio();

  Future<List<ListUsersModel>?> getDataUsers() async {
    String url = "http://apikoperasi.rey1024.com/users";
    final Response response;
    try {
      response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        print("Berhasil");
        var json = response.data;
        if (json is Map && json.keys.contains('data')) {
          var data = json['data'];
          if (data is List) {
            return data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }
   postLogin(String username, String password) async {
    String url = 'http://apikoperasi.rey1024.com';
    final Response response;
    FormData formData =
        FormData.fromMap({"username": username, "password": password});
    response = await dio.post(
      url,
      data: formData,
    );
    if (response.data['status'] == "success") {
      final data = response.data;
      print(data['user_id']);
      return ListUsersModel(
        user_id: data['data'][0]['user_id'],
        username: username,
        password: password,
        nama: data['data'][0]['nama'],
        saldo: data['data'][0]['saldo'],
      );
    } else {
      print('gagal');
      return postLogin(username, password);
    }
  }

  transfer(int user_id, double jumlah_setoran) async {
    String url = 'https://koperasiundiksha.000webhostapp.com/setoran';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_setoran": jumlah_setoran});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }

  postRegister(String username, String password, String nama, String nim) async {
    String url = 'http://apikoperasi.rey1024.com/register';
    final Response response;
    FormData formData = FormData.fromMap(
        {"username": username, "password": password, "nama": nama, "nim": nim});
    response = await dio.post(
      url,
      data: formData,
    );
    if (response.data['status'] == "success") {
      print('Berhasil');
      return true;
    } else {
      print(response.data);
      return false;
    }
  }

   tarikSaldo(int user_id, double jumlah_tarikan) async {
    String url = 'https://koperasiundiksha.000webhostapp.com/tarikan';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_tarikan": jumlah_tarikan});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }
}