import 'package:flutter/material.dart';
import 'package:konversi_suhu_pertemuan4/widget/dropDown.dart';
import 'package:konversi_suhu_pertemuan4/widget/hasil.dart';
import 'package:konversi_suhu_pertemuan4/widget/inputSuhu.dart';
import 'package:konversi_suhu_pertemuan4/widget/konversi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobsheet 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Konverter Suhu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectDropDown = "Kelvin";
  double hasilPerhitungan = 0;
  List<String> listHasil = [];

  void onDropdownChanged(Object? value) {
    return setState(() {
      selectDropDown = value.toString();
    });
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectDropDown) {
          case "Kelvin":
            hasilPerhitungan = int.parse(etInput.text) + 273.15;
            break;
          case "Reamur":
            hasilPerhitungan = int.parse(etInput.text) * 4 / 5;
            break;
          case "Fahrenheit":
            hasilPerhitungan = (int.parse(etInput.text) * 9 / 5) + 32;
            break;
          default:
        }
        listHasil.add("Konversi dari " +
            etInput.text +
            " Celcius ke " +
            selectDropDown +
            " dengan hasil " +
            (hasilPerhitungan.toString()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              inputSuhu(etInput: etInput),
              const SizedBox(
                height: 8,
              ),
              dropDown(
                  selectDropDown: selectDropDown,
                  listSatuanSuhu: listSatuanSuhu,
                  dropDown1: onDropdownChanged),
              SizedBox(height: 10),
              Text("Hasil", style: TextStyle(fontSize: 20)),
              hasil(hasilPerhitungan: hasilPerhitungan),
              SizedBox(height: 10),
              konversi(onPressed: konversiSuhu),
              const SizedBox(height: 10),
              const Text("Riwayat Konversi", style: TextStyle(fontSize: 20)),
              Expanded(
                child: ListView.builder(
                  itemCount: listHasil.length,
                  itemBuilder: (context, index) {
                    return Text(listHasil[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
