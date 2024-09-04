import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solution/app/core/constants/constant.dart';
import '../../../core/utils/exlir_tile_view.dart';
import '../../../core/utils/generic_search.dart';
import '../../../data/api/custom_exception.dart';
import '../../../data/middleware/state_management.dart';

class ElixirsScreen extends ConsumerStatefulWidget {
  @override
  _ElixirsScreenState createState() => _ElixirsScreenState();
}

class _ElixirsScreenState extends ConsumerState<ElixirsScreen> {
  String searchQuery = '';
  String sortOption = 'Name';

  @override
  Widget build(BuildContext context) {
    final elixirsAsyncValue = ref.watch(elixirsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.elixirsTitle),
      ),
      body: Column(
        children: [
          SearchWidget(
            hintText: Constants.search,
            onSearchChanged: (query) {
              setState(() {
                searchQuery = query.toLowerCase();
              });
            },
          ),
          _buildSortDropdown(),
          Expanded(
            child: elixirsAsyncValue.when(
              data: (elixirs) {
                List filteredElixirs = elixirs.where((elixir) {
                  return elixir.name.toLowerCase().contains(searchQuery) ||
                      elixir.difficulty.toLowerCase().contains(searchQuery) ||
                      (elixir.manufacturer?.toLowerCase().contains(searchQuery) ?? false);
                }).toList();

                if (sortOption == 'Name') {
                  filteredElixirs.sort((a, b) => a.name.compareTo(b.name));
                } else if (sortOption == 'Difficulty') {
                  filteredElixirs.sort((a, b) => a.difficulty.compareTo(b.difficulty));
                }

                return ListView.builder(
                  itemCount: filteredElixirs.length,
                  itemBuilder: (context, index) {
                    final elixir = filteredElixirs[index];
                    return ExlirDetailsTile(data: elixir);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) {
                String errorMessage;
                if (error is CustomException) {
                  errorMessage = error.message;
                } else {
                  errorMessage = 'An unexpected error occurred';
                }
                return Center(
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: sortOption,
        items: const [
          DropdownMenuItem(value: 'Name', child: Text('Sort by Name')),
          DropdownMenuItem(value: 'Difficulty', child: Text('Sort by Difficulty')),
        ],
        onChanged: (value) {
          setState(() {
            sortOption = value!;
          });
        },
      ),
    );
  }
}
