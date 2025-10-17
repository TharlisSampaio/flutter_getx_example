import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

// 1. Extende GetxService para garantir persistência (não é removido da memória)
class AuthService extends GetxService {
  RxBool isAuthenticated = false.obs;
  RxString authToken = ''.obs; // simula o token de autenticação

  // Método para ser chamado quando o login for bem-sucedido
  void setAuthenticated(String token) {
    authToken.value = token;
    isAuthenticated.value = true;
    debugPrint('AuthService: Usuário autenticado com token: $token');
  }

  // Método para limpar o status de logout
  void logout() {
    authToken.value = '';
    isAuthenticated.value = false;
    debugPrint('AuthService: Usuário deslogado');
  }
}