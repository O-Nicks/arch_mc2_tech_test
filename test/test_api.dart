import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:arch_mc2_tech_test/main_api.dart' as app;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Affiche la temperature courante depuis le mock serveur',
          (WidgetTester tester) async {

        final resp = await http.get(Uri.parse('http://127.0.0.1:8080/weather'));
        expect(resp.statusCode, 200);
        final json = jsonDecode(resp.body) as Map<String, dynamic>;
        final current = json['current'] as Map<String, dynamic>;
        final expected = (current['temp_c'] as num).toDouble();

        app.main();
        await tester.pumpAndSettle();

        String dec1(num v) => v.toStringAsFixed(1);
        final en = dec1(expected).replaceAll('.', r'\.');
        final fr = dec1(expected).replaceAll('.', ',');

        final regex = RegExp(r'\b(' + en + r'|' + fr + r')\b');
        expect(find.byWidgetPredicate((w) {
          if (w is Text) {
            final s = w.data ?? '';
            return regex.hasMatch(s);
          }
          return false;
        }), findsWidgets);

      });
}