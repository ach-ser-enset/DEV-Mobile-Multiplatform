import 'package:flutter/material.dart';
import './quiz.dart';
import './weather.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First App'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text(
          'Hello',
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: In a Drawer's ListView, you typically want to set padding to EdgeInsets.zero
          // to remove the default top padding that pushes content down due to status bar.
          padding: EdgeInsets.zero,
          children: <Widget>[
            // The DrawerHeader is typically used for user profile info or app branding.
            new DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.orange, Colors.white]),
              ),
              child: Center( // Center the content within the header
                child: Column( // Use a Column to arrange items vertically
                  mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                  children: [
                    CircleAvatar(
                      radius: 50,
                      // For NetworkImage, ensure you have internet permissions in AndroidManifest.xml
                      // and Info.plist, and that the URL is valid.
                      backgroundImage: NetworkImage('https://placehold.co/100x100/FFA500/FFFFFF?text=Profile'),
                      // A fallback for when the image fails to load (optional but good practice)
                      onBackgroundImageError: (exception, stackTrace) {
                        print('Error loading image: $exception');
                      },
                    ),
                    SizedBox(height: 8), // Spacer
                    Text(
                      'User Name', // Example user name
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Quiz',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                // Close the drawer first
                Navigator.of(context).pop();
                // Then navigate to the Quiz page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quiz()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Weather',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                // Close the drawer first
                Navigator.of(context).pop();
                // Then navigate to the Weather page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Weather()),
                );
              },
            ),
            // You can add more ListTiles for other navigation options here
          ],
        ),
      ),
    );
  }
}
