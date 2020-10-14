import 'package:flutter/material.dart';
import 'package:alquran/viewModel/AyatViewModel.dart';

class DetailAlQuran extends StatefulWidget {
  final String nomor;
  final String nama;

  DetailAlQuran({this.nomor, this.nama});
  @override
  _DetailAlQuranState createState() => _DetailAlQuranState();
}

class _DetailAlQuranState extends State<DetailAlQuran> {
  List dataAyat = List();
  void getAyat() {
    AyatViewModel().getAyat(int.parse(widget.nomor)).then((value) {
      setState(() {
        dataAyat = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAyat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.nama}"),
      ),
      body: dataAyat == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataAyat.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                      title: Container(
                    padding: EdgeInsets.only(top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(dataAyat[i].ar ?? ""),
                        Container(
                          padding: EdgeInsets.all(5),
                        ),
                        Text(
                          dataAyat[i].id ?? "",
                          style: TextStyle(fontSize: 8),
                          textAlign: TextAlign.end,
                        ),
                        Divider()
                      ],
                    ),
                  )),
                );
              },
            ),
    );
  }
}
