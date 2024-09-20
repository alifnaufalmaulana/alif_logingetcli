import 'package:cobagetx/app/data/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/login_model.dart';


class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();
  final box = GetStorage();
  var name = ''.obs;

  // Fungsi untuk login ke server API
  Future<void> login(String name, String password) async {
    try {
      isLoading(true);
      var response = await GetConnect().post(
        'https://ereka.web.id/api/login', // Ganti dengan URL API
        {
          'name': name,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var loginData = LoginModel.fromJson(response.body);
        loginModel.value = loginData;
        print(response.body);

        Get.snackbar('Success', 'Login successful'); // Notifikasi sukses
      } else {
        Get.snackbar('Error', 'Login failed'); // Notifikasi jika gagal
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred'); // Notifikasi jika ada error
    } finally {
      isLoading(false);
    }
  }
}

