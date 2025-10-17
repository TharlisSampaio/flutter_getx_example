import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login/src/controller/user_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ********** AQUI ESTÁ A CHAVE DA COMUNICAÇÃO **********
    // Use Get.find() para obter a instância que foi registrada no main.dart
    // final UserController userController = Get.find<UserController>();
    final UserController userController = UserController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Name: ${userController.name.value}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10,),
            Obx(
              () => Text(
                'Status: ${userController.isPremium.value ? 'Premium' : 'Free'}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                // Ao deslogar, limpamos o usuário e voltamos para o login
                userController.logout(); // Chama a função para limpar os dados
                Get.offAllNamed('/login');
              },
              child: const Text('Sair (Logout)'),
            )
          ]
        )
      ),
    );
  }
}
