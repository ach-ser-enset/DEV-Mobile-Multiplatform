import 'package:flutter/material.dart';

// The Quiz widget is now a StatefulWidget because its internal 'counter' state changes.
class Quiz extends StatefulWidget {
  // It no longer takes 'counter' in its constructor from the main app,
  // as the counter state will be managed internally by this widget.
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Define the counter as a state variable for the Quiz.
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
        title: Text('Quiz'),
        backgroundColor: Colors.blueAccent, // A different color for the Quiz app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: <Widget>[
            Text(
              'Quiz Counter: $_counter', // Display the state variable
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20), // Add some spacing
            ElevatedButton( // Replaced RaisedButton with ElevatedButton
              child: Text(
                'Increment Quiz Counter',
                style: TextStyle(fontSize: 18), // Added text style for better visibility
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Background color for ElevatedButton
                foregroundColor: Colors.white, // Text color for ElevatedButton
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding for button
                shape: RoundedRectangleBorder( // Rounded corners
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5, // Shadow
              ),
              onPressed: _incrementCounter, // Call the method to increment counter
            ),
            // You can add more quiz-related widgets here, like questions and answer options
          ],
        ),
      ),
    );
  }
}
