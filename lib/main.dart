import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login/src/bindings/login_binding.dart';
import 'package:getx_login/src/controller/user_controller.dart';
import 'package:getx_login/src/pages/home_screen.dart';
import 'package:getx_login/src/pages/login_screen.dart';
import 'package:getx_login/src/route_guard/route_quard.dart';
import 'package:getx_login/src/services/auth_service.dart';

void main() {
  // ********** REGISTRO GLOBAL **********
  // Cria a instância do UserController e a mantém na memória
  // por toda a vida útil do app.
  Get.put(AuthService()); // Você também pode usar Get.put(AuthService()); se não for assíncrono.
  Get.put(UserController()); 
  // *************************************
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login App With GetX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(
          secondary: Colors.amber,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          labelStyle: TextStyle(color: Colors.deepPurple),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            foregroundColor: Colors.white
          )
        ),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
          binding: LoginBinding() // <--- AQUI! O Binding é anexado à rota
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
          middlewares: [RouteQuard()]
        ),
      ],
    );
  }
}