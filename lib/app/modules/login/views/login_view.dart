import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController nameController = TextEditingController(); // Controller untuk input name
  final TextEditingController passwordController = TextEditingController(); // Controller untuk input password

  @override
  Widget build(BuildContext context) {

// Inisialisasi LoginController secara manual
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => TextField(
                controller: nameController..text = controller.name.value,
                decoration: InputDecoration(labelText: 'Name'),
              )
            ),
            // TextField(
            //   controller: nameController,
            //   decoration: InputDecoration(labelText: 'Name'), // Input name
            // ),

          //   TextField(
          //   onChanged: (value) {
          //     controller.name.value = value; // Simpan username
          //   },
          //   decoration: InputDecoration(labelText: 'Username'),
          // ),

            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'), // Input password
              obscureText: false, // Teks password tersembunyi
            ),
            SizedBox(height: 20),
            Obx(() {
              return controller.isLoading.value
                  ? CircularProgressIndicator() // Tampilkan loading
                  : ElevatedButton(
                      onPressed: () {
                        String name = nameController.text.trim();
                        String password = passwordController.text.trim();

                        if (name.isNotEmpty && password.isNotEmpty) {
                          controller.login(name, password); // Panggil login jika input valid
                        } else {
                          Get.snackbar('Error', 'Name and password are required'); // Notifikasi error jika input kosong
                        }
                      },
                      child: Text('Login'),
                    );
            }),
          ],
        ),
      ),
    );
  }
}