import 'package:flutter/material.dart'; // Mengimpor pustaka dasar Flutter yang diperlukan.
import 'package:healthtrackpro/about_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';  // Mengimpor pustaka Syncfusion Flutter Charts untuk menggambar grafik.

void main() {
  runApp(MaterialApp(
    home: MyHomePage(), // Menjalankan aplikasi Flutter dengan MyHomePage() sebagai halaman utama.
  ));
}

class ChartData {
  final String x;  // Nama kategori atau label pada sumbu X dalam grafik.
  final int y1;    // Nilai pertama pada sumbu Y.
  final int y2;    // Nilai kedua pada sumbu Y.
  final int y3;    // Nilai ketiga pada sumbu Y.

  ChartData(this.x, this.y1, this.y2, this.y3); // Konstruktor untuk menginisialisasi properti.
}

final List<ChartData> chartData = [  // Membuat list objek ChartData.
  ChartData('Sun', 50, 50, 25),  // Data untuk hari Minggu.
  ChartData('Mon', 100, 50, 50), // Data untuk hari Senin.
  ChartData('Tue', 50, 50, 50),  // Data untuk hari Selasa.
  ChartData('Wed', 50, 50, 75),  // Data untuk hari Rabu.
  ChartData('Thu', 80, 50, 50),  // Data untuk hari Kamis.
  ChartData('Fri', 80, 50, 100), // Data untuk hari Jumat.
  ChartData('Sat', 80, 50, 100), // Data untuk hari Sabtu.
];


final List<Color> seriesColors = [
  Color(0xFFff3b2f), // Daftar warna yang akan digunakan dalam grafik.
  Color(0xFFff9501),
  Color(0xFFffcc00),
  Color(0xFFd9d9d9),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key); // Deklarasi kelas MyHomePage.

  @override
  _MyHomePageState createState() => _MyHomePageState();  // Mengganti metode createState untuk membuat _MyHomePageState.
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0; // Inisialisasi variabel untuk mengatur indeks pada bottom navigation bar.
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Mendapatkan lebar layar perangkat saat ini. 
    double screenHeight = MediaQuery.of(context).size.height; // Mendapatkan tinggi layar perangkat saat ini.
    return Scaffold(
       // Bagian tampilan utama aplikasi.
      body: ListView( 
        children: <Widget>[
              Row(
              children: <Widget>[
                GestureDetector(  // GestureDetector mendeteksi ketika gambar profil pengguna ditekan dan akan menjalankan fungsi navigasi ke halaman 'MyAbout'.
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyAbout(),  //  Menampilkan MyAbout saat diakses.
                      ),
                    );
                  },
                  child: Hero( // Ini menggunakan Hero widget untuk mengaktifkan efek animasi transisi saat pergi ke halaman 'MyAbout'. 
                    tag: 'userProfile', 
                    child: Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.04, left: screenWidth * 0.05), // Margin gambar profil.
                      width: screenWidth * 0.2, // Lebar Container gambar profil.
                      height: screenHeight * 0.1,  // Tinggi Container gambar profil.
                      alignment: Alignment.center, // Mengatur posisi gambar profil di tengah.
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),  // Gambar profil.
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10), // Memberikan sudut bulat pada Container.
                      ),
                    ),
                  ),
                ),
              SizedBox(width: screenWidth * 0.03, height: screenHeight * 0.1), // Tambahkan jarak setelah gambar
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.04), // Menambahkan jarak ke atas.
                          child: Text(
                            'Hello👋,',
                            style: TextStyle(
                              fontSize: 20,  // Ukuran font.
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.01), // Menambahkan jarak ke atas.
                          child: Text(
                            'Grace Ligit Nuh',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Memberikan bobot tebal pada teks nama.
                              fontSize: 20, // Ukuran font.
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight, // Menempatkan ikon di sebelah kanan
                      child: Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.04, top: screenHeight * 0.04),  // Menambahkan jarak dari tepi kanan dan atas.
                        child: Icon(
                          Icons.notifications_none, // Ikon notifikasi.
                          size: 30,  // Ukuran ikon
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.03, left: screenWidth * 0.05, right: screenWidth * 0.05), // Padding untuk konten.
            child: Column(  // Membuat kolom (Column) untuk mengelompokkan widget.
              crossAxisAlignment: CrossAxisAlignment.start, // Mengatur penataan widget ke kiri.
              children: <Widget>[ // Daftar widget dalam kolom ini.
                Row(  // Membuat baris (Row) dalam kolom untuk menampilkan beberapa teks dan angka.
                  children: <Widget>[ // Daftar widget dalam baris ini.
                    Expanded(  // Menggunakan Expanded untuk mengisi ruang yang tersedia secara merata.
                      child: Row(  // Baris untuk menampilkan teks dan angka.
                        children: <Widget>[ // Daftar widget dalam baris ini.
                          Text(
                            '1,032',  // Menampilkan angka 1,032.
                            style: TextStyle(
                              color: Color(0xFF007afc),  // Mengatur warna teks menjadi biru.
                              fontSize: 24, // Mengatur ukuran font teks.
                              fontWeight: FontWeight.bold,  // Membuat teks menjadi tebal.
                            ),
                          ),
                          Text(
                            ' gr', // Menampilkan teks "gr" (gram).
                            style: TextStyle(
                              fontSize: 16,  // Mengatur ukuran font teks.
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Goal : 312',  // Menampilkan teks "Goal : 312".
                      style: TextStyle(
                        fontSize: 20, // Mengatur ukuran font teks.
                        fontWeight: FontWeight.bold, // Membuat teks menjadi tebal.
                      ),
                    ),
                    Text(
                      ' gr', // Menampilkan teks "gr" (gram).
                      style: TextStyle(
                        fontSize: 16, // Mengatur ukuran font teks.
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.005), // Membuat spasi vertikal sebelum teks berikutnya.
                Text(
                  'Daily Avg Carbs', // Menampilkan teks "Daily Avg Carbs".
                  style: TextStyle(
                    fontSize: 20,  // Mengatur ukuran font teks.
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),  // Membuat spasi vertikal dengan ketinggian 20.
          // Grafik menggunakan SfCartesianChart.
          Container(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: screenWidth * 0), // Menghilangkan garis grid utama di sumbu X.
                labelStyle: TextStyle(
                  color: Colors.black,  // Mengatur warna label sumbu X menjadi hitam.
                  fontWeight: FontWeight.bold, // Membuat label sumbu X menjadi tebal.
                ),
              ),
              primaryYAxis: NumericAxis(
                labelFormat: '{value} gr', // Format label pada sumbu Y (ditampilkan dengan 'gr').
                majorGridLines: MajorGridLines(width: screenWidth * 0), // Menghilangkan garis grid utama di sumbu Y
              ),
              series: <ChartSeries>[
                StackedColumnSeries<ChartData, String>( // Menampilkan data pertama
                  dataSource: chartData,
                  xValueMapper: (ChartData ch, _) => ch.x, // Menghubungkan data ke sumbu X (hari).
                  yValueMapper: (ChartData ch, _) => ch.y1, // Menghubungkan data ke sumbu Y (karbohidrat).
                  pointColorMapper: (ChartData data, _) => seriesColors[0], // Mengatur warna data.
                ),
                StackedColumnSeries<ChartData, String>(  // Menampilkan data kedua
                  dataSource: chartData,
                  xValueMapper: (ChartData ch, _) => ch.x, // Menghubungkan data ke sumbu X (hari).
                  yValueMapper: (ChartData ch, _) => ch.y2, // Menghubungkan data ke sumbu Y (protein).
                  pointColorMapper: (ChartData data, _) => seriesColors[1], // Mengatur warna data.
                ),
                StackedColumnSeries<ChartData, String>( // Menampilkan data ketiga
                  dataSource: chartData,
                  xValueMapper: (ChartData ch, _) => ch.x,  // Menghubungkan data ke sumbu X (hari).
                  yValueMapper: (ChartData ch, _) => ch.y3, // Menghubungkan data ke sumbu Y (fat).
                  pointColorMapper: (ChartData data, _) => seriesColors[2], // Mengatur warna data.
                ),
              ],
            ),
          ),
        Container(
         // color: Color(0xFFededf1), // Mengatur warna latar belakang Container.
          child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget>[
         Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.06, top: screenHeight * 0.01), // Memberikan jarak pada sisi kiri dan atas.
            child: Row(
              children: <Widget>[
                Text(
                  "Widget",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24, // Mengatur ukuran font teks "Widget".
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, // Mengatur posisi "Edit" ke kanan.
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.07), // Memberikan jarak pada sisi kanan "Edit".
                        child: Text(
                          "Edit", // Teks "Edit" di sebelah kanan "Widget".
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18, // Mengatur ukuran font teks "Edit".
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),  // Memberikan jarak vertikal setelah teks "Widget".
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: screenWidth * 0.06, right: screenWidth * 0.03), // Memberikan jarak di sisi kiri dan kanan Container.
                width: screenWidth * 0.4, // Mengatur lebar Container pertama.
                height: screenHeight * 0.18, // Mengatur tinggi Container pertama.
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 67, 141, 219), // Mengatur warna latar belakang Container pertama.
                  borderRadius: BorderRadius.circular(10), // Memberikan sudut bulat pada Container.
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: screenHeight * 0.03, // Mengatur posisi dari atas pada Container kecil pertama dalam Stack.
                      left: screenWidth * 0.05, // Mengatur posisi dari kiri pada Container kecil pertama dalam Stack.
                      child: Container(
                        width: screenWidth * 0.15, // Mengatur lebar Container kecil pertama.
                        height: screenHeight * 0.08, // Mengatur tinggi Container kecil pertama.
                          decoration: BoxDecoration(
                           color: Color(0xFFeef0eb),// Mengatur warna latar belakang Container kecil pertama.
                          borderRadius: BorderRadius.circular(10), // Memberikan sudut bulat pada Container kecil pertama.
                        ),
                         child: Image.asset(
                          'assets/images/human-footprints.png', // Ganti dengan path gambar yang sesuai.
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.12), // Memberikan jarak pada sisi kiri dan atas pada teks dalam Container kecil pertama.
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Stap',
                                style: TextStyle(
                                 // color: Color(0xFFafafaf), // Mengatur warna teks "Stap".
                                  fontSize: 14,  // Mengatur ukuran font teks "Stap".
                                  fontWeight: FontWeight.bold, // Memberikan bobot tebal pada teks "Stap".
                                ),
                              ),
                              Text(
                                '4,013',
                                style: TextStyle(
                                  fontSize: 16, // Mengatur ukuran font untuk nilai "Stap".
                                  fontWeight: FontWeight.bold, // Memberikan bobot tebal pada nilai "Stap".
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: screenWidth * 0.06, right: screenWidth * 0.03), // Memberikan jarak di sisi kiri dan kanan Container.
                width: screenWidth * 0.4, // Mengatur lebar Container kedua.
                height: screenHeight * 0.18, // Mengatur lebar Container kedua
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 67, 141, 219),   // Mengatur warna latar belakang Container kedua.
                  borderRadius: BorderRadius.circular(10), // Memberikan sudut bulat pada Container.
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: screenHeight * 0.03,  // Mengatur posisi dari atas pada Container kecil kedua dalam Stack.
                      left: screenWidth * 0.05, // Mengatur posisi dari kiri pada Container kecil kedua dalam Stack.
                      child: Container(
                        width: screenWidth * 0.15, // Mengatur lebar Container kecil kedua.
                        height: screenHeight * 0.08, // Mengatur tinggi Container kecil kedua.
                          decoration: BoxDecoration(
                          color: Color(0xFFeef0eb), // Mengatur warna latar belakang Container kecil kedua.
                          borderRadius: BorderRadius.circular(10),  // Memberikan sudut bulat pada Container kecil kedua.
                        ),
                        child: Image.asset(
                          'assets/images/training.png', // Ganti dengan path gambar yang sesuai.
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.12), // Memberikan jarak pada sisi kiri dan atas pada teks dalam Container kecil kedua.
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Distance Covered',
                                style: TextStyle(
                                  fontSize: 14, // Mengatur ukuran font teks "Distance Covered".
                                  fontWeight: FontWeight.bold, // Memberikan bobot tebal pada teks "Distance Covered".
                                ),
                              ),
                              Text(
                                '5,3 Km',
                                style: TextStyle(
                                  fontSize: 16,  // Mengatur ukuran font untuk nilai "Distance Covered".
                                  fontWeight: FontWeight.bold, // Memberikan bobot tebal pada nilai "Distance Covered".
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ],
         ), 
        ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // Indeks item yang dipilih saat ini.
        selectedItemColor: Colors.blue, // Warna item yang dipilih.
        unselectedItemColor: Colors.grey, // Warna item yang tidak dipilih.
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home'); // Navigasi ke rute utama.
          } else if (index == 2) {
            Navigator.of(context).pushNamed('/progress'); // Navigasi ke rute '/progress'.
          } else if (index == 3) {
            Navigator.of(context).pushNamed('/profile'); // Navigasi ke rute '/about'.
          } else {
            setState(() {
              currentIndex = index; // Menetapkan indeks yang dipilih.
            });
          }
        },
        items: [
          // Item pada BottomNavigationBar.
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon "Home".
            label: "Home",  // Label "Home".
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),  // Ikon "Search".
            label: "Search",  // Label "Search".
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp), // Ikon "Progress".
            label: "Progress", // Label "Progress".
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined), // Ikon "Profile".
            label: "Profile", // Label "Profile".
          ),
        ],
      ),
    );
  }
}
