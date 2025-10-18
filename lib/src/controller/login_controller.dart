import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:getx_login/src/controller/user_controller.dart';
import 'package:getx_login/src/data/api_client.dart';
import 'package:getx_login/src/services/auth_service.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  RxBool isLoadind = false.obs;
  RxString error = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;

  // ********** AQUI ESTÁ A CHAVE DA COMUNICAÇÃO **********
  // Use Get.find() para obter a instância que foi registrada no main.dart
  final UserController userController = Get.find<UserController>();
  final AuthService authService = Get.find<AuthService>();

  final ApiClient _apiClient = ApiClient();

  Future<void> login(String email, String password) async {
    isLoadind.value = true;

    await Future.delayed(const Duration(seconds: 2));
    final Map<String, String> data = {
      'email': email,
      'password': password,
    };

    try {
      final response = await _apiClient.post(
        '/login',
        data: data,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final String token = data['token'];
        final Map<String, dynamic> userData = data['user'];

      
        authService.setAuthenticated(token); // <--- Chama o service para registar e o status token
      
        // ********** AQUI ESTÁ A CHAVE DA COMUNICAÇÃO **********
        // Faz a chamada de um método de outro controller
        userController.setUserLogLoggetIn(
          newName: userData['name'],
          newEmail: userData['email'],
        );
      
        error.value = '';
        isLoadind.value = false;
        Get.offAllNamed('/home');
      } else {
        error.value = 'Email ou senha incorretos';
        isLoadind.value = false;
        return;
      }
    } catch (e) {
      SnackBar(
        content: Text("Erro ao fazer login", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      );
      isLoadind.value = false;
      debugPrint("Erro ao fazer login: $e");
    }
    isLoadind.value = false;
  }
}