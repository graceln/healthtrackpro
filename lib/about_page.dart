import 'package:flutter/material.dart';

class MyAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final userProfileHero = Hero(
      tag: 'userProfile',
      child: CircleAvatar(
        radius: 80,
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Me",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userProfileHero,
              ],
            ),
            SizedBox(height: screenHeight * 0.06),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Grace Ligit Nuh',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    'Class',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Informatika B'21",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    'NIM',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "2109106107",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
