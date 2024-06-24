import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyHomeSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const MyHomeSearchBar({super.key, required this.onSearch});

  @override
  _MyHomeSearchBarState createState() => _MyHomeSearchBarState();
}

class _MyHomeSearchBarState extends State<MyHomeSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  void _handleSearch(String query) {
    widget.onSearch(query); // Call the callback function with the search query
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xff26547c)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Row(
        children: [
          const Icon(Iconsax.search_normal, color: Color(0xff26547c)),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for Recipe',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onSubmitted: _handleSearch,
            ),
          ),
        ],
      ),
    );
  }
}
