import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ThemeProvider.dart'; // Import ThemeProvider

class ThemeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HealthTrack Pro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to HealthTrack Pro', style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 20),
            Text('Track Your Health Data', style: Theme.of(context).textTheme.bodyLarge),
            Text('Monitor Your Progress', style: Theme.of(context).textTheme.bodyMedium),
            Text('Stay on Top of Your Fitness', style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Redirecting to Home...'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: Text('Go to Home Page'),
            ),
            SizedBox(height: 20),
            Text('Change Theme:', style: Theme.of(context).textTheme.bodySmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.wb_sunny),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false).setTheme(ThemeMode.light);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.nightlight_round),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false).setTheme(ThemeMode.dark);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
