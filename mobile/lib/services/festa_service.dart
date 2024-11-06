import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/festa.dart';
import '../models/convidado.dart';

class FestaService {
  final String baseUrl = 'http://localhost:3000/festas';
  final http.Client client;

  FestaService({http.Client? client}) : client = client ?? http.Client();

  Future<List<Festa>> fetchFestas() async {
    final response = await client.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> festasJson = jsonDecode(response.body);
      return festasJson.map((json) {
        List<Convidado> convidados = (json['convidados'] as List<dynamic>)
            .map((item) => Convidado(
                  nome: item['nome'] as String,
                  itens: List<String>.from(item['itens'] as List<dynamic>),
                ))
            .toList();
        return Festa(nome: json['nome'] as String, convidados: convidados);
      }).toList();
    } else {
      throw Exception('Erro ao carregar festas');
    }
  }
}
