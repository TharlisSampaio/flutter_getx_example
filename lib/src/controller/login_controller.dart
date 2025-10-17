import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLoadind = false.obs;
  RxString error = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;

  Future<void> login(String email, String password) async {
    isLoadind.value = true;

    await Future.delayed(const Duration(seconds: 2));

    if (email == 'test@email.com' && password == '123456') {
      error.value = '';
      Get.toNamed('/home');
    } else {
      error.value = 'Email ou senha incorretos';
      isLoadind.value = false;
      return;
    }

    isLoadind.value = false;
  }
}