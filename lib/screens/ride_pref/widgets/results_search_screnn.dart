import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../theme/theme.dart';

class RideScreen extends StatelessWidget {
  final Location departure;
  final Location arrival;
  final DateTime departureDate;
  final int requestedSeats;

  // Constructor to receive the selected ride preferences
  const RideScreen({
    super.key,
    required this.departure,
    required this.arrival,
    required this.departureDate,
    required this.requestedSeats,
  });

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
                    'Departure: ${departure.name}, ${departure.country.name}',
                    style: BlaTextStyles.body.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  // Arrival
                  Text(
                    'Arrival: ${arrival.name}, ${arrival.country.name}',
                    style: BlaTextStyles.body.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  // Time
                  Text(
                    'Time: ${departureDate.hour}:${departureDate.minute.toString().padLeft(2, '0')}',
                    style: BlaTextStyles.body.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  // Seats Available
                  Text(
                    'Seats Available: $requestedSeats',
                    style: BlaTextStyles.body.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Additional Information (if needed)
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}