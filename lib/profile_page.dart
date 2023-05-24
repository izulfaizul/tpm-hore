import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 2;

  void _logout() {
    // Navigate to LoginScreen
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("Profile"),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/cobaprof.jpeg',
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Usamah Faizul Islam",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "123200073",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Informatika",
              style: TextStyle(fontSize: 25),
            )
          ],
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
            backgroundColor: Color.fromRGBO(40, 67, 135, 1),
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
