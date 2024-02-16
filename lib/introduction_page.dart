import 'package:flutter/material.dart';
import 'package:healthtrackpro/theme_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key});
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: Text("Next"),  // Teks tombol
      done: Text("Done"),  // Teks tombol
      onDone: () {
        Navigator.of(context).pop(); // Memanggil Navigator.of(context).pop() untuk menutup halaman pengantar saat tombol "Done" ditekan.
        Navigator.of(context).push( // Menggunakan Navigator.of(context).push() untuk menavigasi ke tampilan lain (ThemeScreen).
          MaterialPageRoute(
            builder: (context) {
              return ThemeScreen(); // Membangun tampilan ThemeScreen dan mengembalikannya.
            },
          ),
        );
      },
      pages: [
        PageViewModel( // Halaman pertama.
          title: "Welcome to HealthTrack Pro", // Judul.
          body: "Track your health easily", // Isi.
          image: Image.asset("assets/images/logo.png") // Gambar.
        ),
        PageViewModel( // Halaman kedua.
          title: "Start Your Health Journey", // Judul.
          body: "Find better health", // Isi.
          image: Image.asset("assets/images/run.png") // Gambar.
        ),
        PageViewModel( // Halaman ketiga.
          title: "Monitor Your Health Progress", // Judul.
          body: "Improve your healthy lifestyle", // Isi.
          image: Image.asset("assets/images/heart.png") // Gambar.
        ),
      ],
    );
  }
}
