import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/server.dart';
import '../models/model_index.dart';

final apiServiceProvider = Provider<WizardWorldApiService>((ref) {
  return WizardWorldApiService();
});

final housesProvider = FutureProvider<List<House>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchHouses();
});

final spellsProvider = FutureProvider<List<Spell>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchSpells();
});

final elixirsProvider = FutureProvider<List<Elixir>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchElixirs();
});