import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DoaModel {
  final String id;
  final String doa;
  final String ayat;
  final String latin;
  final String artinya;

  DoaModel({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,
  });

  factory DoaModel.fromJson(Map<String, dynamic> json) {
    return DoaModel(
      id: json['id'],
      doa: json['doa'],
      ayat: json['ayat'],
      latin: json['latin'],
      artinya: json['artinya'],
    );
  }
}

class DoaListPage extends StatefulWidget {
  @override
  _DoaListPageState createState() => _DoaListPageState();
}

class _DoaListPageState extends State<DoaListPage> {
  List<DoaModel> doaList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchDoaList();
  }

  Future<void> fetchDoaList() async {
    setState(() {
      isLoading = true;
    });

    var url = Uri.parse('https://doa-doa-api-ahmadramadhan.fly.dev/api'); // Ganti URL dengan URL yang sesuai
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      setState(() {
        doaList = List<DoaModel>.from(jsonResponse.map((data) => DoaModel.fromJson(data)));
        isLoading = false;
      });
    } else {
      print('Request failed with status: ${response.statusCode}');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doa List'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: doaList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(doaList[index].doa),
                  subtitle: Column(
                    children: [
                      Text(doaList[index].ayat),
                      Text(doaList[index].artinya),
                    ],
                  ) 
                  
                );
              },
            ),
    );
  }
}