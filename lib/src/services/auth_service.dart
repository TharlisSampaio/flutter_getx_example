import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 1. Extende GetxService para garantir persistência (não é removido da memória)
class AuthService extends GetxService {
  RxBool isAuthenticated = false.obs;
  RxString authToken = ''.obs; // simula o token de autenticação

  late SharedPreferences _prefs;

  Future<AuthService> init() async {
    _prefs = await SharedPreferences.getInstance();

    String? storedToken = _prefs.getString("authToken");
    if (storedToken != null && storedToken.isNotEmpty) {
      authToken.value = storedToken;
      isAuthenticated.value = true;
    }
    return this;
  }

  // Método para ser chamado quando o login for bem-sucedido
  void setAuthenticated(String token) {
    _prefs.setString("authToken", token);
    authToken.value = token;
    isAuthenticated.value = true;
    debugPrint('AuthService: Usuário autenticado com token: $token');
  }

  // Método para limpar o status de logout
  void logout() {
    _prefs.remove("authToken");
    authToken.value = '';
    isAuthenticated.value = false;
    debugPrint('AuthService: Usuário deslogado');
  }
}