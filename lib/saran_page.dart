import 'package:flutter/material.dart';

class SaranPage extends StatefulWidget {
  const SaranPage({ Key? key }) : super(key: key);

  @override
  State<SaranPage> createState() => _SaranPageState();
}

class _SaranPageState extends State<SaranPage> {
  int _currentIndex = 1;

  void _logout() {
    // Navigate to LoginScreen
    Navigator.pushReplacementNamed(context, '/login');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text('Kesan dan Pesan'),
          ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              //Image.asset('images/foto.jpeg'),
              SizedBox(height: 10,),
              Text("Kesan", style: TextStyle(fontSize: 28),),
              Text("dalam pembelajaran  kelompok kita bisa saling bertukar pikiran dan saling membantu satu sama lain jika ada teman yang tidak bisa atau tidak paham tentang meteri atau program jadi seru dan sangat efektif", style: TextStyle(fontSize: 17)),

              SizedBox(height: 25),
              Text("Pesan", style: TextStyle(fontSize: 28),),
              Text("untuk melanjutkan lagi sistem pembelajaran yang di mana ada tugas kelompok dan dilanjutkan dengan presentasi tugas kelompok", style: TextStyle(fontSize: 17)),
            ],
          ),
        ),
      ),
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
            backgroundColor: Color.fromRGBO(40, 67, 135, 1),
            icon: Icon(Icons.notes_outlined),
            label: 'Saran',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(40, 67, 135, 1),
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF284387),
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}