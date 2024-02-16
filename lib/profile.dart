import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int currentIndex = 3; // Inisialisasi variabel untuk mengatur indeks pada bottom navigation bar.

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: screenHeight * 0.04,
              left: screenWidth * 0.08,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/about');
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle_outlined,
                      size: 50,
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    Text(
                      "About Me",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.35),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (index == 2) {
            Navigator.of(context).pushNamed('/progress');
          } else if (index == 3) {
            Navigator.of(context).pushNamed('/profile');
          } else {
            // Perhatikan bahwa Anda tidak perlu setState dalam stateless widget.
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: "Progress",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
