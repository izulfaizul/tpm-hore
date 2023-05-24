import 'package:flutter/material.dart';
import 'doa_list.dart';
import 'mata_uang.dart';
import 'konversi_waktu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _logout() {
    // Navigate to LoginScreen
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Home'),
        ),
      ),
      body: Container(
          child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 12),
              Expanded(
                child: Column(
                  children: [
                    Text("Menu", style: TextStyle(fontSize: 36)),
                    SizedBox(height: 24.0),
                    InkWell(
                      child: Text(
                        'Konversi Mata Uang',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KonversiMataUang()));
                      },
                    ),
                    SizedBox(height: 10.0),
                    InkWell(
                      child: Text(
                        'Konversi Waktu',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KonversiWaktu()));
                      },
                    ),
                    SizedBox(height: 10.0),
                    InkWell(
                      child: Text(
                        'Kumpulan Doa Doa',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoaListPage()));
                      },
                    ),
                  ],
                ),
              ),
            ]),
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/home');
            }
            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/saran');
            }
            if (index == 2) {
              Navigator.pushReplacementNamed(context, '/profile');
            }
            if (index == 3) {
              _logout();
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(40, 67, 135, 1),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes_outlined),
            label: 'Saran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
