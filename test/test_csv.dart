// integration_test/temp_csv_e2e_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';

import 'package:arch_mc2_tech_test/main_csv.dart' as app; // <- lance ton main CSV

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Affiche la temperature depuis le CSV (16.2°C)',
          (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        const expected = 16.2;

        final regex = RegExp(r'\b16[.,]2\b');
        expect(find.byWidgetPredicate((w) {
          if (w is Text) {
            final s = w.data ?? '';
            return regex.hasMatch(s);
          }
          return false;
        }), findsWidgets);

      });
}