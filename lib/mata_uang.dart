import 'package:flutter/material.dart';

String firstCurrency = "USD";
String secondCurrency = "IDR";
double secondValue = 0;

class KonversiMataUang extends StatefulWidget {
  const KonversiMataUang({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _KonversiMatauang();
}

class _KonversiMatauang extends State<KonversiMataUang> {
  var items = ["USD", "IDR", "RUB", "EUR"];
  List<double> converts = [1, 14936, 186.70, 0.92];
  var currencys = [
    {"currency": "USD", "value": 1},
    {"currency": "IDR", "value": 14936},
    {"currency": "RUB", "value": 186.70},
    {"currency": "EUR", "value": 0.92}
  ];
  final TextEditingController _firstValueController = TextEditingController();

  void _calculateConvert() {
    int? firstValue = int.tryParse(_firstValueController.text);

    firstValue ??= 0;

    setState(() {
      int from = items.indexOf(firstCurrency);
      int to = items.indexOf(secondCurrency);

      secondValue = double.parse(
          ((firstValue! / converts[from]) * converts[to]).toStringAsFixed(3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Konversi Mata Uang"),
        ),
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // Warna border
              width: 2.0, // Ketebalan border
            ),
          ),
          child: Center(
              child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Konversi Mata Uang",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 90,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Warna border
                    width: 2.0, // Ketebalan border
                  ),
                ),
                
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: _firstValueController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Input value',
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      width: 70,
                      child: new DropdownButton(
                          isExpanded: true,
                          // Initial Value
                          value: firstCurrency,

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
                              firstCurrency = newValue!;
                              
                            });
                          }),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('To'),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        width: 70,
                        child: new DropdownButton(
                            // Initial Value
                            value: secondCurrency,

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
                                secondCurrency = newValue!;
                              });
                            })),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: _calculateConvert, child: Text("Konversi")),
              
              SizedBox(
                height: 30,
              ),

              Text("Hasil", style: TextStyle(fontSize: 28),),
              Text("$secondValue", style: TextStyle(fontSize: 20),)
            ],
          )),
        ));
  }
}
