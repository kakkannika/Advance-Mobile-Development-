import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  int _selectedSeats = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close, color: BlaColors.primary),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, // Ensure horizontal centering
                children: [
                  Text(
                    "Number of seats to book",
                    style: BlaTextStyles.heading.copyWith(fontFamily: 'Eesti'),
                  ),
                  SizedBox(height: BlaSpacings.l),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (_selectedSeats > 1) _selectedSeats--;
                          });
                        },
                        icon: Icon(Icons.remove, color: BlaColors.iconNormal),
                      ),
                      Text(
                        '$_selectedSeats',
                        style: BlaTextStyles.body.copyWith(fontFamily: 'Eesti'),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (_selectedSeats < 10) _selectedSeats++;
                          });
                        },
                        icon: Icon(Icons.add, color: BlaColors.iconNormal),
                      ),
                    ],
                  ),
                  SizedBox(height: BlaSpacings.l),
                  ElevatedButton(
                    onPressed: () {
                      // Handle seat booking logic here
                    },
                    child: Text('Book Seats', style: BlaTextStyles.button.copyWith(fontFamily: 'Eesti')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: SeatSelectionScreen(),
    );
  }
}