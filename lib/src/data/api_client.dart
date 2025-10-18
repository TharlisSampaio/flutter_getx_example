
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:getx_login/src/services/auth_service.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = dotenv.env['URL_API'] ?? 'url nao encontrada';
  final AuthService _authService = Get.find<AuthService>();
  
  // Método de Tratamento de Erro Global (Interceptor Simulado)
  void _handleError(http.Response response) {
    if (response.statusCode == 401) {
      // 401 Unauthorized: Token JWT expirado ou inválido
      _authService.logout();
      Get.offAllNamed('/login');
      Get.snackbar(
        'Sessaõo expirada',
        'Faça login novamente para continuar',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Colors.white,
      );
    }
  }

  // Cliente GET para rotas protegidas
  Future<http.Response> get(String path) async {
    final token = _authService.authToken.value;

    // Header with token
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(Uri.parse('$baseUrl$path'), headers: headers);
    _handleError(response);
    return response;
  }

  // Cliente POST (para Login, sem token)
  Future<http.Response> post(String path, {required Map<String, dynamic> data}) async {
    final response = await http.post(
      Uri.parse('$baseUrl$path'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    _handleError(response);
    return response;
  }
}