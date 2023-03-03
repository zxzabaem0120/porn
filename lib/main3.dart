import 'package:flutter/material.dart';
import 'main2.dart';
import 'main.dart';

class A1 extends StatefulWidget {
  const A1({super.key});

  @override
  State<A1> createState() => _A1State();
}

class _A1State extends State<A1> {
  TextEditingController? p1;
  String p2 = '';
  Widget textFieldInput(
      {String? title,
      TextEditingController? textinput,
      void Function(String)? method,
      double width = 160,
      double height = 35}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 0),
          child: Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            height: height,
            width: width,
            child: TextField(
              controller: textinput,
              onChanged: method,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ),
      ],
    );
  }

  Widget dropdownInput(BuildContext context,
      {Object? dopdown,
      List<DropdownMenuItem<Object>>? item,
      void Function(Object?)? onchang}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color.fromARGB(255, 230, 230, 230),
        child: SizedBox(
          height: 40,
          width: 70,
          child: DropdownButton(
            icon:
                const Icon(Icons.arrow_drop_down_rounded, color: Colors.black),
            dropdownColor: Colors.white,
            value: dopdown,
            items: item,
            onChanged: onchang,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.black,
        height: 50,
      ),
      appBar: AppBar(
        //
        backgroundColor: const Color.fromARGB(255, 173, 163, 19),
        centerTitle: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Text("คำนวณการผ่อนชำระ"),
        ]),
      ),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'การผ่อนชำระ',
            style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
          ),
        ), //
        Column(
          children: [
            Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: textFieldInput(title: 'ยอดการกู้', textinput: p1),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 30),
                  child: textFieldInput(title: 'ดอกเบี้ย %ต่อปี'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 50),
                  child: textFieldInput(title: 'ผ่อนชำระต่อเดือน'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 30),
                  child: textFieldInput(title: 'ดอกเบี้ย %ต่อปี'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Row(
                    children: [
                      const Text(
                        'วันที่เริ่มชำระ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      dropdownInput(context,
                          dopdown: Appdata.d,
                          item: Appdata.day
                              .map((value) => DropdownMenuItem(
                                  value: value, child: Text(value)))
                              .toList(), onchang: (value) {
                        Appdata.d = value;
                      }),
                      dropdownInput(context,
                          dopdown: Appdata.m,
                          item: Appdata.month
                              .map((value) => DropdownMenuItem(
                                  value: value, child: Text(value)))
                              .toList(), onchang: (value) {
                        Appdata.m = value;
                      }),
                      dropdownInput(context,
                          dopdown: Appdata.y,
                          item: Appdata.year
                              .map((value) => DropdownMenuItem(
                                  value: value, child: Text(value)))
                              .toList(), onchang: (value) {
                        Appdata.y = value;
                      }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        //p2 = 'hello';
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const V1()))
                            .then((value) {
                          setState(() {});
                        });
                      });
                    },
                    style: (const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black))),
                    child: const Text('คำนวณ'),
                  ),
                ),
                Text(p2)
              ]),
            ),
          ],
        ),
      ]),
    );
  }
}