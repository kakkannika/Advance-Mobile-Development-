import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../theme/theme.dart';
import '../../../dummy_data/dummy_data.dart'; 

class LocationPickerScreen extends StatefulWidget {
  final String title;
  final Location? initialLocation;

  const LocationPickerScreen({
    super.key,
    required this.title,
    this.initialLocation,
  });

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Location> _filteredLocations = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.initialLocation?.name ?? '';
    _updateSearchResults('');
  }

  // Update the list of locations based on the search query
  void _updateSearchResults(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      if (_isSearching) {
        _filteredLocations = fakeLocations
            .where((location) =>
                location.name.toLowerCase().contains(query.toLowerCase()) ||
                location.country.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        _filteredLocations = [];
      }
    });
  }

  // Navigate back with selected location
  void _onLocationSelected(Location location) {
    Navigator.pop(context, location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(BlaSpacings.m),
        child: Column(
          children: [
            // Search Bar
            _buildSearchBar(),
            // Search Results
            Expanded(child: _buildSearchResults()),
          ],
        ),
      ),
    );
  }

  // Search bar with modern design
  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: BlaSpacings.s),
      decoration: BoxDecoration(
        color: BlaColors.greyLight,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
        boxShadow: [
          BoxShadow(
            color: BlaColors.neutralLight.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Back Button
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          // Search Text Field
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: _updateSearchResults,
              decoration: InputDecoration(
                hintText: "Search location...",
                border: InputBorder.none,
              ),
             
            ),
          ),
          // Clear Button (only shown during search)
          _isSearching
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _updateSearchResults('');
                  },
                )
              : SizedBox(width: 0),
        ],
      ),
    );
  }

  // Display search results based on user input
  Widget _buildSearchResults() {
    return _filteredLocations.isNotEmpty
        ? ListView.builder(
            itemCount: _filteredLocations.length,
            itemBuilder: (context, index) {
              final location = _filteredLocations[index];
              return Column(
                children: [
                  ListTile(
                   
                    title: Text(location.name, style: BlaTextStyles.body),
                    subtitle: Text(location.country.name, style: BlaTextStyles.label),
                    trailing: Icon(Icons.arrow_forward_ios, size: 20),
                    onTap: () => _onLocationSelected(location),
                  ),
                  Divider(), 
                ],
              );
            },
          )
        : Center();
  }
}
