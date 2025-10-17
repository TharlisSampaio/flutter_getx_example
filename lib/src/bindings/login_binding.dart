import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_login/src/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  // 2. O método dependencies é onde você 'injeta' os Controllers
  void dependencies() {
    // Get.lazyPut: A instância só será criada quando for usada pela primeira vez.
    // É o método mais recomendado para a maioria dos Controllers de View.
    Get.lazyPut<LoginController>(() => LoginController(),);
    
    // Você pode ter quantos Controllers precisar:
    // Get.lazyPut<OutroController>(() => OutroController());
  }
}