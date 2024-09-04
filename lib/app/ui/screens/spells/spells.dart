import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solution/app/core/constants/constant.dart';
import '../../../core/utils/generic_search.dart';
import '../../../data/middleware/bookmark_management.dart';
import '../../../data/middleware/state_management.dart';

class SpellsScreen extends ConsumerStatefulWidget {
  const SpellsScreen({super.key});

  @override
  _SpellsScreenState createState() => _SpellsScreenState();
}

class _SpellsScreenState extends ConsumerState<SpellsScreen> {
  String searchQuery = '';
  String filterType = 'All';

  @override
  Widget build(BuildContext context) {
    final spellsAsyncValue = ref.watch(spellsProvider);
    final bookmarkedSpells =
        ref.watch(bookmarkProvider); // Watch the bookmarkProvider for changes

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.spellTitle),
      ),
      body: Column(
        children: [
          SearchWidget(
            hintText: Constants.searchSpell,
            onSearchChanged: (query) {
              setState(() {
                searchQuery = query.toLowerCase();
              });
            },
          ),
          _buildFilterDropdown(),
          Expanded(
            child: spellsAsyncValue.when(
              data: (spells) {
                List filteredSpells = spells.where((spell) {
                  final matchesQuery =
                      spell.name.toLowerCase().contains(searchQuery) ||
                          spell.type.toLowerCase().contains(searchQuery) ||
                          spell.effect.toLowerCase().contains(searchQuery);

                  final matchesType =
                      filterType == 'All' || spell.type == filterType;

                  return matchesQuery && matchesType;
                }).toList();

                return ListView.builder(
                  itemCount: filteredSpells.length,
                  itemBuilder: (context, index) {
                    final spell = filteredSpells[index];
                    final isBookmarked = bookmarkedSpells
                        .contains(spell.id); // Check if the spell is bookmarked

                    return ListTile(
                      title: Text(
                        spell.name,
                      ),
                      subtitle: Text(
                        spell.type,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          color: isBookmarked ? Colors.amber : null,
                        ),
                        onPressed: () {
                          ref
                              .read(bookmarkProvider.notifier)
                              .toggleBookmark(spell.id); // Toggle the bookmark
                        },
                      ),
                      onTap: () {},
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) =>
                  const Center(child: Text(Constants.errorLoadSpells)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: filterType,
        items: const [
          DropdownMenuItem(value: 'All', child: Text('All')),
          DropdownMenuItem(value: 'Charm', child: Text('Charm')),
          DropdownMenuItem(value: 'Curse', child: Text('Curse')),
          DropdownMenuItem(value: 'Hex', child: Text('Hex')),
          DropdownMenuItem(value: 'Jinx', child: Text('Jinx')),
          DropdownMenuItem(value: 'Spell', child: Text('Spell')),
        ],
        onChanged: (value) {
          setState(() {
            filterType = value!;
          });
        },
      ),
    );
  }
}
