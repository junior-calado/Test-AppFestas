import 'package:flutter/material.dart';
import '../models/festa.dart';
import '../services/festa_service.dart';
import '../widgets/festa_card_widget.dart';

class FestaListScreen extends StatelessWidget {
  final FestaService festaService = FestaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Festas')),
      body: FutureBuilder<List<Festa>>(
        future: festaService.fetchFestas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro ao carregar festas');
          } else {
            final festas = snapshot.data ?? [];
            return ListView.builder(
              itemCount: festas.length,
              itemBuilder: (context, index) => FestaCardWidget(festa: festas[index]),
            );
          }
        },
      ),
    );
  }
}
