import 'package:flutter/material.dart';
import '../models/festa.dart';

class FestaCardWidget extends StatelessWidget {
  final Festa festa;

  FestaCardWidget({required this.festa});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(festa.nome),
        subtitle: Text('Convidados: ${festa.convidados.length}'),
      ),
    );
  }
}
