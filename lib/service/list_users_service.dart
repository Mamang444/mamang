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
        // print("Berhasil");
        var json = response.data;
          if (json is List) {
            return json
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();
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
    if (response.statusCode == 200) {
      final data = response.data;
      return ListUsersModel(
        user_id: data[0]['user_id'],
        username: username,
        password: password,
        nama: data[0]['nama'],
        saldo: data[0]['saldo'],
        nomor_rekening: data[0]['nomor_rekening'],
      );
    } else {
      print('gagal');
      // return postLogin(username, password);
    }
  }


  transfer(int user_id, double jumlah_setoran, String nomor_rekening) async {
    String url = 'http://apikoperasi.rey1024.com/transfer';
    final Response response;
    FormData formData = FormData.fromMap(
        {"id_pengirim": user_id, "jumlah_transfer": jumlah_setoran, "nomor_rekening": nomor_rekening});
    try {
      print(user_id);
      print(jumlah_setoran);
      print(nomor_rekening);
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }

  getSaldo(int user_id) async {
    String url = 'http://apikoperasi.rey1024.com/getsingleuser';
    final Response response;
    FormData formData = FormData.fromMap({"user_id": user_id});
    response = await dio.post(url, data: formData);
    if (response.statusCode == 200) {
      final data = response.data;
      print(data[0]['saldo']);
      return int.parse(data[0]['saldo']);
      // return print(response.statusCode);
    } else {
      return print('gagal');
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

   tarik(int user_id, double jumlah_tarikan) async {
    String url = 'http://apikoperasi.rey1024.com/tarikan';
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

  setor(int user_id, double jumlah_setoran) async{
    String url = 'http://apikoperasi.rey1024.com/setoran';
    final Response response;
    FormData formData = FormData.fromMap(
      {"user_id": user_id, "jumlah_setoran": jumlah_setoran}
    );
    try{
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e){
      print('gagal');
    }
  }
}