import 'package:flutter/material.dart'; // Mengimpor pustaka dasar Flutter yang diperlukan.
import 'package:syncfusion_flutter_charts/charts.dart'; // Mengimpor pustaka Syncfusion Flutter Charts untuk menggambar grafik.
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    home: Input(), // Menjalankan aplikasi Flutter dengan Input() sebagai halaman Progress.
  ));
}

class NutritionData {
  final String day;
  int karbohidrat;
  int protein;
  int fat;

  NutritionData(this.day, this.karbohidrat, this.protein, this.fat); // Membuat kelas NutritionData yang berisi data nutrisi harian.
}

List<NutritionData> nutritionDataList = [
  NutritionData('Mon', 0, 0, 0), // Inisialisasi daftar nutrisi dengan nilai awal.
  NutritionData('Tue', 0, 0, 0),
  NutritionData('Wed', 0, 0, 0),
  NutritionData('Thu', 0, 0, 0),
  NutritionData('Fri', 0, 0, 0),
  NutritionData('Sat', 0, 0, 0),
  NutritionData('Sun', 0, 0, 0),
];

final List<Color> seriesColors = [
  Color(0xFFff3b2f), // Daftar warna yang akan digunakan dalam grafik.
  Color(0xFFff9501),
  Color(0xFFffcc00),
];

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  int currentIndex = 2; // Inisialisasi variabel untuk mengatur indeks pada bottom navigation bar.
  final TextEditingController karbohidratControllerSenin = TextEditingController();
  final TextEditingController proteinControllerSenin = TextEditingController();
  final TextEditingController fatControllerSenin = TextEditingController();
  final TextEditingController karbohidratControllerSelasa = TextEditingController();
  final TextEditingController proteinControllerSelasa = TextEditingController();
  final TextEditingController fatControllerSelasa = TextEditingController();
  final TextEditingController karbohidratControllerRabu = TextEditingController();
  final TextEditingController proteinControllerRabu = TextEditingController();
  final TextEditingController fatControllerRabu = TextEditingController();
  final TextEditingController karbohidratControllerKamis = TextEditingController();
  final TextEditingController proteinControllerKamis = TextEditingController();
  final TextEditingController fatControllerKamis = TextEditingController();
  final TextEditingController karbohidratControllerJumat = TextEditingController();
  final TextEditingController proteinControllerJumat = TextEditingController();
  final TextEditingController fatControllerJumat = TextEditingController();
  final TextEditingController karbohidratControllerSabtu = TextEditingController();
  final TextEditingController proteinControllerSabtu = TextEditingController();
  final TextEditingController fatControllerSabtu = TextEditingController();
  final TextEditingController karbohidratControllerMinggu = TextEditingController();
  final TextEditingController proteinControllerMinggu = TextEditingController();
  final TextEditingController fatControllerMinggu = TextEditingController();
  int karbohidratDimasukkan = 0;
  int proteinDimasukkan = 0;
  int fatDimasukkan = 0;
  int radioButtonValue = 0; // Nilai radio button
  bool showData1 = true; // Status checkbox pertama
  bool showData2 = true; // Status checkbox pertama
  bool showData3 = true; // Status checkbox pertama
  String selectedDay = 'Monday'; // Inisialisasi variabel string yang akan digunakan untuk melacak hari yang dipilih.

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Mendapatkan lebar layar perangkat saat ini. 
    double screenHeight = MediaQuery.of(context).size.height; // Mendapatkan tinggi layar perangkat saat ini.
    return Scaffold(
      appBar: AppBar(
          title: Text(
          "Progress", // Judul
          style: TextStyle(
          fontSize: 24, // Ukuran font
          fontWeight: FontWeight.bold, // Memberikan bobot tebal
        ),
      )),
      body: CupertinoScrollbar( // Menggunakan CupertinoScrollBar saat ingin mengscroll
          child: ListView(
        // Membuat ListView sebagai konten utama halaman.
        children: <Widget>[
          // Daftar widget yang akan ditampilkan dalam ListView.
          Padding(
            padding:  EdgeInsets.only(top: screenHeight * 0.03, left: screenWidth * 0.05, right: screenWidth * 0.05), // Padding untuk konten.
            child: Column(
              // Membuat kolom (Column) untuk mengelompokkan widget.
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Mengatur penataan widget ke kiri.
              children: <Widget>[
                // Daftar widget dalam kolom ini.
                Row(
                  // Membuat baris (Row) dalam kolom untuk menampilkan beberapa teks dan angka.
                  children: <Widget>[
                    // Daftar widget dalam baris ini.
                    Expanded(
                      // Menggunakan Expanded untuk mengisi ruang yang tersedia secara merata.
                      child: Row(
                        // Baris untuk menampilkan teks dan angka.
                        children: <Widget>[
                          // Daftar widget dalam baris ini.
                          Text(
                            '1,032', // Menampilkan angka 1,032.
                            style: TextStyle(
                              color: Color(
                                  0xFF007afc), // Mengatur warna teks menjadi biru.
                              fontSize: 24, // Mengatur ukuran font teks.
                              fontWeight: FontWeight
                                  .bold, // Membuat teks menjadi tebal.
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
                    ),
                    Text(
                      'Goal : 312', // Menampilkan teks "Goal : 312".
                      style: TextStyle(
                        fontSize: 20, // Mengatur ukuran font teks.
                        fontWeight:
                            FontWeight.bold, // Membuat teks menjadi tebal.
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
                SizedBox(
                    height: screenHeight * 0.005), // Membuat spasi vertikal sebelum teks berikutnya.
                Text(
                  'Daily Avg Carbs', // Menampilkan teks "Daily Avg Carbs".
                  style: TextStyle(
                    fontSize: 20, // Mengatur ukuran font teks.
                  ),
                ),
              ],
            ),
          ),
          // Checkbox untuk menampilkan/menyembunyikan data
          Padding(
            padding: const EdgeInsets.all(16.0), // Padding untuk seluruh kolom checkbox.
            child: Column(
              children: <Widget>[
                Row(
                  // Baris pertama untuk checkbox Karbohidrat.
                  children: <Widget>[
                    Checkbox(
                      value:
                          showData1, // Nilai checkbox yang akan berubah sesuai dengan tindakan pengguna.
                      onChanged: (bool? value) {
                        setState(() {
                          showData1 = value ??
                              true; // Mengubah nilai showData1 sesuai dengan nilai checkbox.
                        });
                      },
                    ),
                    Container(
                      width: screenWidth * 0.06,
                      height: screenHeight * 0.03,
                      color: Color(0xFFff3b2f), // Warna kotak di samping checkbox untuk Karbohidrat.
                    ),
                    SizedBox(width: screenWidth * 0.02), // Spasi horizontal antara kotak warna dan teks.
                    Text(
                        'Carbohydrate'
                    ), // Teks yang menjelaskan checkbox ini adalah untuk Karbohidrat.
                  ],
                ),
                Row(
                  // Baris kedua untuk checkbox Protein.
                  children: <Widget>[
                    Checkbox(
                      value:
                          showData2, // Nilai checkbox yang akan berubah sesuai dengan tindakan pengguna.
                      onChanged: (bool? value) {
                        setState(() {
                          showData2 = value ??
                              true; // Mengubah nilai showData2 sesuai dengan nilai checkbox.
                        });
                      },
                    ),
                    Container(
                      width: screenWidth * 0.06,
                      height: screenHeight * 0.03,
                      color: Color(
                          0xFFff9501), // Warna kotak di samping checkbox untuk Protein.
                    ),
                    SizedBox(
                        width: screenWidth * 0.02), // Spasi horizontal antara kotak warna dan teks.
                    Text(
                        'Protein'), // Teks yang menjelaskan checkbox ini adalah untuk Protein.
                  ],
                ),
                Row(
                  // Baris ketiga untuk checkbox Lemak.
                  children: <Widget>[
                    Checkbox(
                      value:
                          showData3, // Nilai checkbox yang akan berubah sesuai dengan tindakan pengguna.
                      onChanged: (bool? value) {
                        setState(() {
                          showData3 = value ??
                              true; // Mengubah nilai showData3 sesuai dengan nilai checkbox.
                        });
                      },
                    ),
                    Container(
                      width: screenWidth * 0.06,
                      height: screenHeight * 0.03,
                      color: Color(
                          0xFFffcc00), // Warna kotak di samping checkbox untuk Lemak.
                    ),
                    SizedBox(
                          width: screenWidth * 0.02), // Spasi horizontal antara kotak warna dan teks.
                    Text(
                        'Fat'), // Teks yang menjelaskan checkbox ini adalah untuk Lemak.
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0), // Membuat spasi vertikal dengan ketinggian 20.
          Container(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: screenWidth * 0), // Menghilangkan garis grid utama di sumbu X.
                labelStyle: TextStyle(
                  color: Colors.black, // Mengatur warna label sumbu X menjadi hitam.
                  fontWeight:
                      FontWeight.bold, // Membuat label sumbu X menjadi tebal.
                ),
              ),
              primaryYAxis: NumericAxis(
                labelFormat:
                    '{value} gr', // Format label pada sumbu Y (ditampilkan dengan 'gr').
                majorGridLines: MajorGridLines(width: screenWidth * 0), // Menghilangkan garis grid utama di sumbu Y.
              ),
              series: <ChartSeries>[
                if (showData1) // Menampilkan atau menyembunyikan data pertama sesuai status checkbox
                  StackedColumnSeries<NutritionData, String>(
                    dataSource: nutritionDataList,
                    xValueMapper: (NutritionData data, _) =>
                        data.day, // Menghubungkan data ke sumbu X (hari).
                    yValueMapper: (NutritionData data, _) => data
                        .karbohidrat, // Menghubungkan data ke sumbu Y (karbohidrat).
                    pointColorMapper: (NutritionData data, _) =>
                        seriesColors[0], // Mengatur warna data.
                  ),
                if (showData2) // Menampilkan atau menyembunyikan data kedua sesuai status checkbox
                  StackedColumnSeries<NutritionData, String>(
                    dataSource: nutritionDataList,
                    xValueMapper: (NutritionData data, _) =>
                        data.day, // Menghubungkan data ke sumbu X (hari).
                    yValueMapper: (NutritionData data, _) => data
                        .protein, // Menghubungkan data ke sumbu Y (protein).
                    pointColorMapper: (NutritionData data, _) =>
                        seriesColors[1], // Mengatur warna data.
                  ),
                if (showData3) // Menampilkan atau menyembunyikan data ketiga sesuai status checkbox
                  StackedColumnSeries<NutritionData, String>(
                    dataSource: nutritionDataList,
                    xValueMapper: (NutritionData data, _) =>
                        data.day, // Menghubungkan data ke sumbu X (hari).
                    yValueMapper: (NutritionData data, _) =>
                        data.fat, // Menghubungkan data ke sumbu Y (lemak).
                    pointColorMapper: (NutritionData data, _) =>
                        seriesColors[2], // Mengatur warna data.
                  ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                  'Select the day to enter data:'), // Teks yang menjelaskan tujuan radio button.
              RadioListTile(
                title:
                    Text('Monday'), // Teks yang menampilkan nama hari "Senin".
                value:
                    'monday', // Nilai yang akan dipilih jika radio button ini dipilih.
                groupValue:
                    selectedDay, // Nilai grup yang digunakan untuk mengelompokkan radio button.
                onChanged: (value) {
                  setState(() {
                    selectedDay = value
                        .toString(); // Mengubah nilai selectedDay sesuai dengan radio button yang dipilih.
                  });
                },
              ),
              RadioListTile(
                title: Text(
                    'Tuesday'), // Teks yang menampilkan nama hari "Selasa".
                value:
                    'tuesday', // Nilai yang akan dipilih jika radio button ini dipilih.
                groupValue:
                    selectedDay, // Nilai grup yang digunakan untuk mengelompokkan radio button.
                onChanged: (value) {
                  setState(() {
                    selectedDay = value
                        .toString(); // Mengubah nilai selectedDay sesuai dengan radio button yang dipilih.
                  });
                },
              ),
              RadioListTile(
                title: Text(
                    'Wednesday'), // Teks yang menampilkan nama hari "Rabu".
                value:
                    'wednesday', // Nilai yang akan dipilih jika radio button ini dipilih.
                groupValue:
                    selectedDay, // Nilai grup yang digunakan untuk mengelompokkan radio button.
                onChanged: (value) {
                  setState(() {
                    selectedDay = value
                        .toString(); // Mengubah nilai selectedDay sesuai dengan radio button yang dipilih
                  });
                },
              ),
              RadioListTile(
                title: Text(
                    'Thursday'), // Teks yang menampilkan nama hari "Kamis".
                value:
                    'thursday', // Nilai yang akan dipilih jika radio button ini dipilih.
                groupValue:
                    selectedDay, // Nilai grup yang digunakan untuk mengelompokkan radio button.
                onChanged: (value) {
                  setState(() {
                    selectedDay = value
                        .toString(); // Mengubah nilai selectedDay sesuai dengan radio button yang dipilih
                  });
                },
              ),
              RadioListTile(
                title:
                    Text('Friday'), // Teks yang menampilkan nama hari "Jumat".
                value:
                    'friday', // Nilai yang akan dipilih jika radio button ini dipilih.
                groupValue:
                    selectedDay, // Nilai grup yang digunakan untuk mengelompokkan radio button.
                onChanged: (value) {
                  setState(() {
                    selectedDay = value
                        .toString(); // Mengubah nilai selectedDay sesuai dengan radio button yang dipilih
                  });
                },
              ),
              RadioListTile(
                title: Text(
                    'Saturday'), // Teks yang menampilkan nama hari "Sabtu".
                value:
                    'saturday', // Nilai yang akan dipilih jika radio button ini dipilih.
                groupValue:
                    selectedDay, // Nilai grup yang digunakan untuk mengelompokkan radio button.
                onChanged: (value) {
                  setState(() {
                    selectedDay = value
                        .toString(); // Mengubah nilai selectedDay sesuai dengan radio button yang dipilih
                  });
                },
              ),
              RadioListTile(
                title:
                    Text('Sunday'), // Teks yang menampilkan nama hari "Minggu".
                value:
                    'sunday', // Nilai yang akan dipilih jika radio button ini dipilih.
                groupValue:
                    selectedDay, // Nilai grup yang digunakan untuk mengelompokkan radio button.
                onChanged: (value) {
                  setState(() {
                    selectedDay = value
                        .toString(); // Mengubah nilai selectedDay sesuai dengan radio button yang dipilih
                  });
                },
              ),
              SizedBox(height: screenHeight * 0.02), // Membuat spasi vertikal dengan ketinggian 16.
              // Textfield untuk memasukkan data karbohidrat, protein, dan lemak
              // dengan menambahkan kondisi untuk menampilkan atau menyembunyikan
              // Textfield berdasarkan pilihan hari
              if (selectedDay == 'monday')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Data for Monday:'), // Teks yang menampilkan label hari "Senin".
                    SizedBox(height: screenHeight * 0.02), // Membuat spasi vertikal dengan ketinggian 10.
                    TextField(
                      controller:
                          karbohidratControllerSenin, // Menghubungkan controller ke TextField untuk karbohidrat Senin.
                      keyboardType:
                          TextInputType.text, // Tipe keyboard untuk input teks.
                      decoration: InputDecoration(
                        labelText:
                            'Carbohydrate (Monday) ex: 50 gr', // Label dan contoh input.
                        border:
                            OutlineInputBorder(), // Menggunakan border dengan gaya outline.
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02), // Spasi vertikal antara TextField.
                    TextField(
                      controller:
                          proteinControllerSenin, // Menghubungkan controller ke TextField untuk protein Senin.
                      keyboardType:
                          TextInputType.text, // Tipe keyboard untuk input teks.
                      decoration: InputDecoration(
                        labelText:
                            'Protein (Monday) ex: 50 gr', // Label dan contoh input.
                        border:
                            OutlineInputBorder(), // Menggunakan border dengan gaya outline.
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02), // Spasi vertikal antara TextField.
                    TextField(
                      controller:
                          fatControllerSenin, // Menghubungkan controller ke TextField untuk lemak Senin.
                      keyboardType:
                          TextInputType.text, // Tipe keyboard untuk input teks.
                      decoration: InputDecoration(
                        labelText:
                            'Fat (Monday) ex: 50 gr', // Label dan contoh input.
                        border:
                            OutlineInputBorder(), // Menggunakan border dengan gaya outline.
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02), // Membuat spasi vertikal dengan ketinggian 16.
                  ],
                ),
              // Kondisi dan penjelasannya serupa untuk hari-hari lainnya.
              if (selectedDay == 'tuesday')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Data for Tuesday:'),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: karbohidratControllerSelasa,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Carbohydrate (Tuesday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: proteinControllerSelasa,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Protein (Tuesday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: fatControllerSelasa,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Fat (Tuesday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              if (selectedDay == 'wednesday')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Data for Wednesday:'),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: karbohidratControllerRabu,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Carbohydrate (Wednesday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: proteinControllerRabu,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Protein (Wednesday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: fatControllerRabu,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Lemak (Wednesday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              if (selectedDay == 'thursday')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Data for Thursday:'),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: karbohidratControllerKamis,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Carbohydrate (Thursday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: proteinControllerKamis,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Protein (Thursday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: fatControllerKamis,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Fat (Thursday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              if (selectedDay == 'friday')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Data for Friday:'),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: karbohidratControllerJumat,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Carbohydrate (Friday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: proteinControllerJumat,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Protein (Friday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: fatControllerJumat,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Fat (Friday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              if (selectedDay == 'saturday')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Data for Saturday:'),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: karbohidratControllerSabtu,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Carbohydrate (Saturday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: proteinControllerSabtu,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Protein (Saturday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: fatControllerSabtu,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Fat (Saturday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              if (selectedDay == 'sunday')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Data for Sunday:'),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: karbohidratControllerMinggu,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Carbohydrate (Sunday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: proteinControllerMinggu,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Protein (Sunday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      controller: fatControllerMinggu,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Fat (Sunday) ex: 50 gr',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
             SizedBox(height: screenHeight * 0.02), // Membuat spasi vertikal dengan ketinggian 16.
              CupertinoButton.filled( // Menggunakan Cupertino Button
                onPressed: () {
                  setState(() {
                    // Update data karbohidrat, protein, lemak berdasarkan pilihan hari
                    if (selectedDay == 'monday') {
                      // Update data untuk Senin
                      nutritionDataList[0].karbohidrat = _parseGram(karbohidratControllerSenin.text);
                      nutritionDataList[0].protein = _parseGram(proteinControllerSenin.text);
                      nutritionDataList[0].fat = _parseGram(fatControllerSenin.text);
                    }
                    if (selectedDay == 'tuesday') {
                      // Update data untuk Selasa
                      nutritionDataList[1].karbohidrat = _parseGram(karbohidratControllerSelasa.text);
                      nutritionDataList[1].protein = _parseGram(proteinControllerSelasa.text);
                      nutritionDataList[1].fat = _parseGram(fatControllerSelasa.text);
                    }
                    if (selectedDay == 'wednesday') {
                      // Update data untuk Rabu
                      nutritionDataList[2].karbohidrat = _parseGram(karbohidratControllerRabu.text);
                      nutritionDataList[2].protein = _parseGram(proteinControllerRabu.text);
                      nutritionDataList[2].fat = _parseGram(fatControllerRabu.text);
                    }
                    if (selectedDay == 'thursday') {
                      // Update data untuk Kamis
                      nutritionDataList[3].karbohidrat = _parseGram(karbohidratControllerKamis.text);
                      nutritionDataList[3].protein = _parseGram(proteinControllerKamis.text);
                      nutritionDataList[3].fat = _parseGram(fatControllerKamis.text);
                    }
                    if (selectedDay == 'friday') {
                      // Update data untuk Jumat
                      nutritionDataList[4].karbohidrat = _parseGram(karbohidratControllerJumat.text);
                      nutritionDataList[4].protein = _parseGram(proteinControllerJumat.text);
                      nutritionDataList[4].fat = _parseGram(fatControllerJumat.text);
                    }
                    if (selectedDay == 'saturday') {
                      // Update data untuk Sabtu
                      nutritionDataList[5].karbohidrat = _parseGram(karbohidratControllerSabtu.text);
                      nutritionDataList[5].protein = _parseGram(proteinControllerSabtu.text);
                      nutritionDataList[5].fat = _parseGram(fatControllerSabtu.text);
                    }
                    if (selectedDay == 'sunday') {
                      // Update data untuk Minggu
                      nutritionDataList[6].karbohidrat = _parseGram(karbohidratControllerMinggu.text);
                      nutritionDataList[6].protein = _parseGram(proteinControllerMinggu.text);
                      nutritionDataList[6].fat = _parseGram(fatControllerMinggu.text);
                    }
                  });
                },
                child: Text('Input Data'), // Teks yang ditampilkan pada tombol.
              )
            ],
          ),
        ],
      ),
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

  // Untuk di textfield.
  int _parseGram(String value) {
    // Memecah teks input berdasarkan spasi (' ')
    final parts = value.split(' ');

    // Memeriksa apakah ada setidaknya dua bagian setelah pemecahan
    if (parts.length >= 2) {
      // Mengonversi bagian pertama (sebelum spasi) ke dalam nilai numerik
      final numericValue = int.tryParse(parts[0]);

      // Memeriksa apakah nilai numerik berhasil diambil
      if (numericValue != null) {
        return numericValue; // Mengembalikan nilai numerik yang berhasil diambil
      }
    }

    // Jika pemecahan atau konversi gagal, mencetak pesan kesalahan dan mengembalikan 0
    print('Gagal parse: $value');
    return 0;
  }
}
