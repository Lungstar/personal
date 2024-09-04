import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solution/app/ui/screens/spells/spell_details.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Set<String> bookmarkedSpells = {};
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
  }

  void _loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bookmarkedSpells = prefs.getStringList('bookmarkedSpells')?.toSet() ?? {};
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> filteredSpells = bookmarkedSpells.where((spellId) {
      return spellId.contains(searchQuery);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
          children: [
            Text(
              'Spells List', // Add a title or heading
              style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            Expanded( // Expand the ListView to take available space
              child: ListView.builder(
                itemCount: filteredSpells.length,
                itemBuilder: (context, index) {
                  final spellId = filteredSpells[index];
                  return Card( // Wrap ListTile with a Card for better visuals
                    elevation: 2.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: const Icon(Icons.bookmark, color: Colors.deepPurple),
                      title: Text(
                        'Spell: $spellId',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpellDetailScreen(spellId: spellId),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
