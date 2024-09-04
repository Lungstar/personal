import 'package:flutter/material.dart';
import 'package:solution/app/core/constants/constant.dart';
import '../../../data/api/server.dart';
import '../../../data/models/spell_model.dart';

class SpellDetailScreen extends StatefulWidget {
  final String spellId;

  const SpellDetailScreen({super.key, required this.spellId});

  @override
  _SpellDetailScreenState createState() => _SpellDetailScreenState();
}

class _SpellDetailScreenState extends State<SpellDetailScreen> {
  late Future<Spell> _spellFuture;

  @override
  void initState() {
    super.initState();
    _spellFuture = fetchSpellDetails();
  }

  Future<Spell> fetchSpellDetails() async {
    final apiService = WizardWorldApiService();
    return apiService.fetchSpellByID(widget.spellId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.spellDetailsTitle),
      ),
      body: FutureBuilder<Spell>(
        future: _spellFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final spell = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${spell.name}',
                      style:
                          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Type: ${spell.type}', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('Effect: ${spell.effect}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  if (spell.incantation != null &&
                      spell.incantation!.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text('Incantation: ${spell.incantation}',
                        style: const TextStyle(fontSize: 18)),
                  ],
                ],
              ),
            );
          } else {
            return const Center(child: Text(Constants.errorNotFoundSpells));
          }
        },
      ),
    );
  }
}
