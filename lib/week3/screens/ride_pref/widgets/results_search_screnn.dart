import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../theme/theme.dart';

class RideScreen extends StatefulWidget {
  final Location departure;
  final Location arrival;
  final DateTime departureDate;
  final int requestedSeats;

  const RideScreen({
    super.key,
    required this.departure,
    required this.arrival,
    required this.departureDate,
    required this.requestedSeats,
  });

  @override
  _RideScreenState createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Location> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchResults = _filterLocations(_searchController.text);
    });
  }

  List<Location> _filterLocations(String query) {
    // Implement your search logic here
    // For example, filter the locations based on the query
    // This is just a placeholder implementation
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(BlaSpacings.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Back Button with Border and Shadow
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 217, 217),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Ride Details
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Departure
                  Text(
                    'Departure: ${widget.departure.name}, ${widget.departure.country.name}',
                    style: BlaTextStyles.body.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  // Arrival
                  Text(
                    'Arrival: ${widget.arrival.name}, ${widget.arrival.country.name}',
                    style: BlaTextStyles.body.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  // Time
                  Text(
                    'Time: ${widget.departureDate.hour}:${widget.departureDate.minute.toString().padLeft(2, '0')}',
                    style: BlaTextStyles.body.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  // Seats Available
                  Text(
                    'Seats Available: ${widget.requestedSeats}',
                    style: BlaTextStyles.body.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Search Results
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final location = _searchResults[index];
                  return ListTile(
                    title: Text(location.name),
                    subtitle: Text(location.country.name),
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