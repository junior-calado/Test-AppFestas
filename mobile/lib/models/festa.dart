import 'convidado.dart';

class Festa {
  final String nome;
  final List<Convidado> convidados;

  Festa({required this.nome, required this.convidados});

  int totalDeItens() {
    return convidados.fold(0, (sum, convidado) => sum + convidado.itens.length);
  }

  bool excedeLimiteDeConvidados(int limite) {
    return convidados.length > limite;
  }
}
