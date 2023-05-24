import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String dropdownvalue = 'WIB';
var dateNow = DateFormat('EEEE, d MMM, yyyy HH:mm:ss').format(DateTime.now());

void _changeDate() {
  if (dropdownvalue == 'WITA') {
    dateNow = DateFormat('EEEE, d MMM, yyyy, HH:mm:ss')
        .format(DateTime.now().toUtc().add(const Duration(hours: 8)));
  } else if (dropdownvalue == 'WIT') {
    dateNow = DateFormat('EEEE, d MMM, yyyy HH:mm:ss')
        .format(DateTime.now().toUtc().add(const Duration(hours: 9)));
  } else if (dropdownvalue == "WIB") {
    dateNow = DateFormat('EEEE, d MMM, yyyy HH:mm:ss')
        .format(DateTime.now().toUtc().add(const Duration(hours: 7)));
  } else {
    dateNow = DateFormat('EEEE, d MMM, yyyy HH:mm:ss')
        .format(DateTime.now().toUtc().add(const Duration(hours: 1)));
  }
}

class KonversiWaktu extends StatefulWidget {
  @override
  State<KonversiWaktu> createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  // List of items in our dropdown menu
  var items = [
    'WIB',
    'WITA',
    'WIT',
    'London',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Waktu'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                _changeDate();
                return Text(
                  dateNow,
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    _changeDate();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}