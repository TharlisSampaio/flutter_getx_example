import 'package:get/get.dart';
import 'package:getx_login/src/controller/user_controller.dart';
import 'package:getx_login/src/services/auth_service.dart';

class LoginController extends GetxController {
  RxBool isLoadind = false.obs;
  RxString error = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;

  // ********** AQUI ESTÁ A CHAVE DA COMUNICAÇÃO **********
  // Use Get.find() para obter a instância que foi registrada no main.dart
  final UserController userController = Get.find<UserController>();
  final AuthService authService = Get.find<AuthService>();

  Future<void> login(String email, String password) async {
    isLoadind.value = true;

    await Future.delayed(const Duration(seconds: 2));

    if (email == 'test@email.com' && password == '123456') {
      const tokenSimulado = 'TOKEN_123456_GETX';

      authService.setAuthenticated(tokenSimulado); // <--- Chama o service para registar e o status token

      // ********** AQUI ESTÁ A CHAVE DA COMUNICAÇÃO **********
      // Faz a chamada de um método de outro controller
      userController.setUserLogLoggetIn(
        newName: 'Texugo do mel',
        newEmail: email,
      );

      error.value = '';
      Get.offAllNamed('/home');
    } else {
      error.value = 'Email ou senha incorretos';
      isLoadind.value = false;
      return;
    }

    isLoadind.value = false;
  }
}