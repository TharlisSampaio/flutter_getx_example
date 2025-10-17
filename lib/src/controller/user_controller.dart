import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  // Variáveis reativas para dados globais do usuário
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxBool isPremium = false.obs;

  // Função para simular o recebimento de dados após um login bem-sucedido
  void setUserLogLoggetIn({required String newName, required String newEmail}) {
    name.value = newName;
    email.value = newEmail;
    isPremium.value = newName.contains('Admin');
    update(); // Notifica qualquer GetBuilder ou GetX que esteja ouvindo
    debugPrint('Dados do usuário atualizados: $name, $email, $isPremium');
  }

  void logout() {
    name.value = '';
    email.value = '';
    isPremium.value = false;
    update();
    debugPrint('Usuário deslogado: $name, $email, $isPremium');
  }
}