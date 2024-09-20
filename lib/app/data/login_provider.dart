import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../models/login_model.dart'; // Sesuaikan dengan nama proyek Anda

// class LoginProvider extends GetConnect {
//   Future<LoginModel?> auth(Map<String, String> data) async {
//     var myHeader = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json'
//     };

//     try {
//       final response = await post(
//         'https://yourapi.com/api/login',
//         data,
//         headers: myHeader,
//       );

//       if (response.status.hasError) {
//         print("Error: ${response.statusText}");
//         return null;
//       }

//       print("Status Code: ${response.statusCode}");
//       print("Response Body: ${response.body}");

//       // Parse JSON response to LoginModel
//       return LoginModel.fromJson(response.body);
//     } catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }
// }


// class LoginProvider extends GetConnect {
//   Future<LoginModel?> auth(Map<String, String> data) async {
//     var myHeader = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json'
//     };

//     try {
//       final response = await post(
//         'https://ereka.web.id/api/login',
//         data,
//         headers: myHeader,
//       );

//       if (response.status.hasError) {
//         print("Error: ${response.statusText}");
//         return null;
//       }

//       print("Status Code: ${response.statusCode}");
//       print("Response Body: ${response.body}");

//       // Parse JSON response to LoginModel
//       return LoginModel.fromJson(response.body);
//     } catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }
// }

// class LoginProvider extends GetConnect {
//   Future<void> auth(Map<String, String> data) async {
//     var myHeader = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json'
//     };

//     try {
//       final response = await http.post(
//         Uri.parse('https://ereka.web.id/api/login'),
//         headers: myHeader,
//         body: json.encode(data),
//       );

//       if (response.statusCode == 200) {
//         // Berhasil
//         print("Response: ${response.body}");
//       } else {
//         // Gagal
//         print("Error: ${response.statusCode}");
//         print("Response Body: ${response.body}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
// }

class LoginProvider extends GetConnect {
  Future<LoginModel?> auth(Map<String, String> data) async {
    var myHeader = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    try {
      final response = await post(
        'https://ereka.web.id/api/login',
        data,
        headers: myHeader,
      );

      if (response.statusCode == 200) {
        // Parse JSON response to LoginModel
        return LoginModel.fromJson(response.body);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}