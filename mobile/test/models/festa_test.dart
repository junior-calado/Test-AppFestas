import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/models/convidado.dart';
import 'package:mobile/models/festa.dart';

void main() {
  test('Deve calcular o total de itens trazidos para a festa', () {
    final festa = Festa(nome: 'Aniversário', convidados: [
      Convidado(nome: 'Ana', itens: ['Refrigerante', 'Batata']),
      Convidado(nome: 'Carlos', itens: ['Carne', 'Pão']),
    ]);
    expect(festa.totalDeItens(), 4);
  });

  test('Deve retornar verdadeiro se o total de convidados exceder o limite', () {
    final festa = Festa(nome: 'Churrasco', convidados: List.generate(15, (index) => Convidado(nome: 'Pessoa $index', itens: ['Item $index'])));
    expect(festa.excedeLimiteDeConvidados(10), isTrue);
  });
}
