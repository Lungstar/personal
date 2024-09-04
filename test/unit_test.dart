import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:solution/app/data/api/server.dart';
import 'package:solution/app/data/models/spell_model.dart';

class MockWizardWorldApiService extends Mock implements WizardWorldApiService {}

void main() {
  group('WizardWorldApiService', () {
    late MockWizardWorldApiService mockApiService;

    setUp(() {
      mockApiService = MockWizardWorldApiService();
    });

    test('fetchSpells returns list of spells when successful', () async {
      final spells = [
        Spell(
          id: 'spell-id-1',
          name: 'Lumos',
          type: 'Charm',
          effect: 'Creates light',
          incantation: 'Lumos',
        ),
        Spell(
          id: 'spell-id-2',
          name: 'Expelliarmus',
          type: 'Charm',
          effect: 'Disarms opponent',
          incantation: 'Expelliarmus',
        ),
      ];

      when(mockApiService.fetchSpells()).thenAnswer((_) async => spells);

      final result = await mockApiService.fetchSpells();

      expect(result.length, equals(2));
      expect(result.first.name, equals('Lumos'));
      expect(result.last.name, equals('Expelliarmus'));
    });

    test('fetchSpells throws an exception when the API fails', () async {
      when(mockApiService.fetchSpells())
          .thenThrow(Exception('Failed to load spells'));

      expect(() async => await mockApiService.fetchSpells(), throwsException);
    });
  });
}
