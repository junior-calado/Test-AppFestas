import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/services/festa_service.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  test('Deve filtrar festas com mais de 5 convidados', () async {
    final client = MockClient();
    final service = FestaService(client: client);

    when(client.get(Uri.parse('http://localhost:3000/festas')))
        .thenAnswer((_) async => http.Response('[{"nome": "Festa A", "convidados": [{"nome": "Ana", "itens": ["item1"]}, {"nome": "João", "itens": ["item2"]}, {"nome": "Pedro", "itens": ["item3"]}, {"nome": "Lucas", "itens": ["item4"]}, {"nome": "Maria", "itens": ["item5"]}, {"nome": "Clara", "itens": ["item6"]}]}, {"nome": "Festa B", "convidados": [{"nome": "Lucas", "itens": ["item1"]}, {"nome": "Clara", "itens": ["item2"]}, {"nome": "Julia", "itens": ["item3"]}] }]', 200));

    final festas = await service.fetchFestas();
    final festasFiltradas = festas.where((festa) => festa.convidados.length > 5).toList();

    expect(festasFiltradas.length, 1);
    expect(festasFiltradas[0].nome, 'Festa A');
  });
}
