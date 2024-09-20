import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

// class LoginView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Inisialisasi LoginController secara manual
//     final LoginController controller = Get.put(LoginController());

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         foregroundColor: Colors.black,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           iconSize: 30,
//           onPressed: () {
//             Get.back();  // Menggunakan GetX untuk kembali
//           },
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Text(
//               'Silakan login terlebih dahulu',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: controller.userC,
//               decoration: InputDecoration(
//                 icon: Icon(Icons.person),
//                 labelText: 'Username',
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: controller.passC,
//               decoration: InputDecoration(
//                 icon: Icon(Icons.lock),
//                 labelText: 'Password',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => controller.auth(),  // Memanggil metode login dari controller
//               child: Text(
//                 'Login',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF001AFF),
//                 fixedSize: Size(Get.width - 30, 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LoginView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Inisialisasi LoginController
//     final LoginController loginController = Get.put(LoginController());

//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Obx(() {
//         return Column(
//           children: [
//             TextField(
//               controller: loginController.userC,
//               decoration: InputDecoration(labelText: 'Username'),
//             ),
//             TextField(
//               controller: loginController.passC,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             loginController.isLoading.value
//                 ? CircularProgressIndicator() // Tampilkan loading jika sedang memuat
//                 : ElevatedButton(
//                     onPressed: () => loginController.login(),
//                     child: Text("Login"),
//                   ),
//             if (loginController.errorMessage.isNotEmpty)
//               Text(loginController.errorMessage.value, style: TextStyle(color: Colors.red)),
//           ],
//         );
//       }),
//     );
//   }
// }
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