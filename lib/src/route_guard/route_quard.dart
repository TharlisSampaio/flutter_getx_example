import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login/src/services/auth_service.dart';

class RouteQuard extends GetMiddleware {
  // 1. Encontra o Serviço de Autenticação
  final AuthService authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    // 2. Verifica se o usuário está autenticado
    if (!authService.isAuthenticated.value) {
      Get.snackbar(
        'Acesso negado',
        'Você precisa fazer login',
        // ignore: deprecated_member_use
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return const RouteSettings(name: '/login');
    }
    // Se estiver autendicado, retorna null para permitir o acesso
    return null;
  }
}