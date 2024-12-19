import 'package:flutter_test/flutter_test.dart';
import 'package:clean_guru/src/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CleanGuruApp());
  });
}