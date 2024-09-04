import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solution/app/core/constants/constant.dart';
import 'package:solution/app/core/utils/house_tile_view.dart';
import '../../../core/utils/generic_search.dart';
import '../../../data/api/custom_exception.dart';
import '../../../data/middleware/state_management.dart';
import '../../../data/models/house_model.dart';

class HousesScreen extends ConsumerStatefulWidget {
  const HousesScreen({super.key});

  @override
  _HousesScreenState createState() => _HousesScreenState();
}

class _HousesScreenState extends ConsumerState<HousesScreen> {
  String searchQuery = '';
  String sortOption = 'Name';

  @override
  Widget build(BuildContext context) {
    final housesAsyncValue = ref.watch(housesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.houseTitle),
      ),
      body: Column(
        children: [
          SearchWidget(
            hintText: Constants.searchHouses,
            onSearchChanged: (query) {
              setState(() {
                searchQuery = query.toLowerCase();
              });
            },
          ),
          _buildSortDropdown(),
          Expanded(
            child: housesAsyncValue.when(
              data: (houses) {
                List<House> filteredHouses = houses.where((house) {
                  return house.name.toLowerCase().contains(searchQuery) ||
                      house.founder.toLowerCase().contains(searchQuery) ||
                      house.houseColours.toLowerCase().contains(searchQuery) ||
                      house.traits.any((trait) => trait.name.toLowerCase().contains(searchQuery));
                }).toList();

                if (sortOption == 'Name') {
                  filteredHouses.sort((a, b) => a.name.compareTo(b.name));
                } else if (sortOption == 'Founder') {
                  filteredHouses.sort((a, b) => a.founder.compareTo(b.founder));
                }

                return ListView.builder(
                  itemCount: filteredHouses.length,
                  itemBuilder: (context, index) {
                    House house = filteredHouses[index];
                    return HouseDetailsTile(data: house);
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
          DropdownMenuItem(value: 'Founder', child: Text('Sort by Founder')),
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
