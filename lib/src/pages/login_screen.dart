import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login/src/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  // ********** MODIFICAÇÃO CHAVE **********
  // Troca o Get.put() pelo Get.find()
  // O Get.find() pressupõe que o Controller já foi injetado (pelo Binding).
  // final LoginController controller = Get.put(LoginController());
  final LoginController controller = Get.find<LoginController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                'Bem-vindo(a)!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple, // Usando a cor primária do tema
                ),
                textAlign: TextAlign.center,
              ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Obx(
                  () => ElevatedButton(
                    onPressed: controller.isLoadind.value
                    ? null // se estiver carregando o botão ficca desabilitado
                    : () {
                      controller.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      child: controller.isLoadind.value
                      ? SizedBox(
                        width: 20,
                        height: 20,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                      : const Text('FAZER LOGIN'),
                    ),
                  )
                ),
                SizedBox(height: 20,),
                Obx(
                  () => Text(
                    controller.error.value,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                )
              ]
            )
          ),
        ),
      )
    );
  }
}
