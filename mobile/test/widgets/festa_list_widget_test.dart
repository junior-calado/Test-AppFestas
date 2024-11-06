import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/festa_list_screen.dart';

void main() {
  testWidgets('Deve exibir a lista de festas', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FestaListScreen()));
    expect(find.text('Lista de Festas'), findsOneWidget);
  });
}
