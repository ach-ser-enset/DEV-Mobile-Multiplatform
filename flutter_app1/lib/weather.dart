import 'package:flutter/material.dart';

// The Weather widget is now a StatefulWidget because its internal 'counter' state changes.
class Weather extends StatefulWidget {
  // It no longer takes 'counter' in its constructor from the main app,
  // as the counter state will be managed internally by this widget.
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  // Define the counter as a state variable.
  // It starts at 0 or any initial value you prefer.
  int _counter = 0;

  // Method to increment the counter and update the UI.
  void _incrementCounter() {
    setState(() {
      // setState tells Flutter to re-run the build method and update the UI.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: <Widget>[
            Text(
              'Counter=$_counter', // Display the state variable
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20), // Add some spacing
            ElevatedButton( // Replaced RaisedButton with ElevatedButton
              child: Text(
                'Add',
                style: TextStyle(fontSize: 18), // Added text style for better visibility
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Changed from 'primary' to 'backgroundColor'
                foregroundColor: Colors.white, // Changed from 'onPrimary' to 'foregroundColor'
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding for button
                shape: RoundedRectangleBorder( // Rounded corners
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5, // Shadow
              ),
              onPressed: _incrementCounter, // Call the method to increment counter
            ),
          ],
        ),
      ),
    );
  }
}
