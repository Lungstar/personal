import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:solution/app/data/api/server.dart';
import 'package:solution/app/data/models/spell_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solution/app/ui/screens/component/favorite.dart';
import 'package:solution/app/ui/screens/spells/spell_details.dart';

class MockWizardWorldApiService extends Mock implements WizardWorldApiService {}

void main() {
  group('Integration Test', () {
    late MockWizardWorldApiService mockApiService;

    setUp(() {
      mockApiService = MockWizardWorldApiService();
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('Add a spell to favorites and view it on FavoritesScreen',
        (WidgetTester tester) async {
      final spell = Spell(
        id: 'spell-id-1',
        name: 'Lumos',
        type: 'Charm',
        effect: 'Creates light',
        incantation: 'Lumos',
      );

      when(mockApiService.fetchSpellByID('spell-id-1'))
          .thenAnswer((_) async => spell);

      await tester.pumpWidget(const MaterialApp(
        home: SpellDetailScreen(spellId: 'spell-id-1'),
      ));

      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pump();

      await tester.pumpWidget(const MaterialApp(
        home: FavoritesScreen(),
      ));

      expect(find.text('Lumos'), findsOneWidget);
    });
  });
}
