import 'package:flutter/material.dart';

typedef OnSearchChanged = void Function(String query);

class SearchWidget extends StatelessWidget {
  final String hintText;
  final OnSearchChanged onSearchChanged;

  SearchWidget({super.key,
    required this.hintText,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(),
        ),
        onChanged: onSearchChanged,
      ),
    );
  }
}
