import 'package:flutter/material.dart'; // Mengimpor pustaka dasar Flutter yang diperlukan.
import 'package:healthtrackpro/ThemeProvider.dart';
import 'package:healthtrackpro/about_page.dart'; // Mengimpor file about_page.dart yang digunakan untuk menentukan halaman about aplikasi.
import 'package:healthtrackpro/home_page.dart';  // Mengimpor file home_page.dart yang digunakan untuk menentukan halaman awal aplikasi.
import 'package:healthtrackpro/input_healthtrackpro_page.dart'; // Mengimpor file input_healthtrackpro_page.dart yang digunakan untuk menentukan halaman progress aplikasi.
import 'package:healthtrackpro/introduction_page.dart';  // Mengimpor file introduction_page.dart yang digunakan untuk menentukan halaman introduce aplikasi.
import 'package:healthtrackpro/profile.dart'; // Mengimpor file profile.dart yang digunakan untuk menentukan halaman profile aplikasi.
import 'package:healthtrackpro/theme_screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Builder(
        builder: (ctx) {
          return MaterialApp(
            title: 'HealthTrack Pro',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.grey,
                brightness: Brightness.light,
              ),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
                brightness: Brightness.dark,
              ),
            ),
            themeMode: Provider.of<ThemeProvider>(ctx).themeMode,
            initialRoute: '/',
             routes: {
              '/': (context) => IntroductionPage(),
              '/home': (context) => MyHomePage(), // Rute utama: '/home'. Menampilkan MyHomePage saat rute '/home' diakses.
              '/theme': (context) => ThemeScreen(),
              '/progress': (context) => Input(),  // Rute '/progress'. Menampilkan Input saat rute '/progress' diakses.
              '/profile': (context) => Profile(), // Rute '/profile'. Menampilkan Input saat rute '/profile' diakses.
              '/about': (context) => MyAbout(), // Rute '/about'. Menampilkan MyAbout saat rute '/about' diakses.
            },
          );
        },
      ),
    );
  }
}


