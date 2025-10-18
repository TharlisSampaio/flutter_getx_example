import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx_login/src/data/api_client.dart';

class ProtectedDataController extends GetxController {
  var data = 'Nenhum dado carregado.'.obs;
  var isLoading = false.obs;
  
  final ApiClient _apiClient = ApiClient();

  @override
  void onInit() {
    fetchProtectedData();
    super.onInit();
  }

  Future<void> fetchProtectedData() async {
    isLoading.value = true;
    
    try {
      final response = await _apiClient.get('/protected'); // Rota protegida

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        data.value = 'Mensagem do servidor: ${decoded['message']}';
      } else {
        // Se não for 200, mas também não for 401 (que seria tratado globalmente)
        data.value = 'Erro ao carregar dados: ${response.statusCode}';
      }
    } catch (e) {
      // Captura a exceção lançada pelo _handleError (ex: "Sessão expirada")
      data.value = 'Erro de requisição: ${e.toString()}';
    }
    
    isLoading.value = false;
  }
}