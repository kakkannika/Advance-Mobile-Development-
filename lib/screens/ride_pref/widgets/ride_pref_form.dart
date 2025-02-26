import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

/// A Ride Preference Form is a view to select:
///   - A departure location
///   - An arrival location
///   - A date
///   - A number of seats
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  @override
  void initState() {
    super.initState();
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      arrival = widget.initRidePref!.arrival;
      departureDate = widget.initRidePref!.departureDate;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } else {
      departure = null;
      departureDate = DateTime.now();
      arrival = null;
      requestedSeats = 1;
    }
  }

  void _updateDeparture(Location location) {
    setState(() {
      departure = location;
    });
  }

  void _updateArrival(Location location) {
    setState(() {
      arrival = location;
    });
  }

  void _updateDepartureDate(DateTime date) {
    setState(() {
      departureDate = date;
    });
  }

  void _updateRequestedSeats(int seats) {
    setState(() {
      requestedSeats = seats;
    });
  }

  void _swapLocations() {
    Location? temp = departure;
    setState(() {
      departure = arrival;
      arrival = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth < 600 ? 14 : 16; 

    return Container(
      margin: EdgeInsets.all(screenWidth < 600 ? 8 : BlaSpacings.m),
      padding: EdgeInsets.all(screenWidth < 600 ? 8 : BlaSpacings.m),
      decoration: BoxDecoration(
        color: BlaColors.white,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
        boxShadow: [
          BoxShadow(
            color: BlaColors.neutralLight.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Departure Location
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: BlaColors.greyLight,
                  width: 1.0,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.circle_outlined),
                      SizedBox(width: 10),
                      Text(
                        departure != null ? departure!.name : "Toulouse",
                        style: BlaTextStyles.body.copyWith(
                          fontFamily: 'Eesti',
                          fontSize: fontSize,
                          color: Colors.blueGrey,
                          
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: _swapLocations,
                  icon: Icon(Icons.swap_vert, color: BlaColors.primary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Arrival Location
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: BlaColors.greyLight,
                  width: 1.0,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.circle_outlined),
                      SizedBox(width: 10),
                      Text(
                        arrival != null ? arrival!.name : "Bordeaux, France",
                        style: BlaTextStyles.body.copyWith(
                          fontFamily: 'Eesti',
                          fontSize: fontSize,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // DateTime Section
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: BlaColors.greyLight,
                  width: 1.0,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.date_range),
                      SizedBox(width: 10),
                      Text(
                        "Sat 22 Feb",
                        style: BlaTextStyles.body.copyWith(
                          fontFamily: 'Eesti',
                          fontSize: fontSize,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Number of Seats
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.person),
                      SizedBox(width: 10),
                      Text(
                        "$requestedSeats",
                        style: BlaTextStyles.body.copyWith(
                          fontFamily: 'Eesti',
                          fontSize: fontSize,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Search Button
          ElevatedButton(
            onPressed: () {
              // Implement search functionality here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: BlaColors.primary,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BlaSpacings.radius),
              ),
            ),
            child: Text(
              'Search',
              style: BlaTextStyles.button.copyWith(
                color: BlaColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}