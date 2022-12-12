import 'package:flutter/cupertino.dart';
import 'package:mamang/model/user_model.dart';
import 'package:dio/dio.dart';

abstract class ILogin {
  Future<UserModel> login(String email, String password) async {
    final api = 'https://reqres.in/api/login';
    final data = {"email" : email, "password" : password};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data); 
    if (response.statusCode == 200) {
      final body = response.data;
      return UserModel(email: email, token: body['token']);
    }else{
      return login(email, password);
    }
  }
} 