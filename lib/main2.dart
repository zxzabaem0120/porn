import 'package:flutter/material.dart';
import 'main3.dart';
import 'main.dart';

class A1 extends StatefulWidget {
  const A1({super.key});

  @override
  State<A1> createState() => _A1State();
}

class _A1State extends State<A1> {
  TextEditingController p1 = TextEditingController(text: '');
  TextEditingController p2 = TextEditingController(text: '');
  TextEditingController p3 = TextEditingController(text: '');
  TextEditingController p4 = TextEditingController(text: '');
  String s1 = '';
  Widget textFieldInput(
      {String? title,
      title2,
      TextEditingController? textinput,
      void Function(String)? method,
      double width = 160,
      double height = 35}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
            top: 0,
          ),
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
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              controller: textinput,
              onChanged: method,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 0),
          child: Text(
            title2!,
            style: const TextStyle(fontWeight: FontWeight.bold),
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
      padding: const EdgeInsets.only(left: 20),
      child: Card(
        color: const Color.fromARGB(255, 230, 230, 230),
        child: SizedBox(
          height: 40,
          width: 80,
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
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/เหรียญ.png',
              width: 35,
              height: 40,
            ),
          ),
          const Text("PS'  Installment payment app "),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset(
              'assets/images/เหรียญ.png',
              width: 35,
              height: 40,
            ),
          ),
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'การผ่อนชำระ',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
          ), //
          Column(children: [
            Center(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: textFieldInput(
                  title: 'ยอดการกู้',
                  title2: 'บาท',
                  textinput: p1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 30),
                child: textFieldInput(
                    title: 'ดอกเบี้ย % ต่อปี', title2: '%', textinput: p2),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 20),
                child: textFieldInput(
                    title: 'ผ่อนชำระต่องวด', title2: 'งวด', textinput: p3),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30, right: 20 ,bottom: 0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'วันที่เริ้มชำระ',
                        
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                      dropdownInput(context,
                          dopdown: Appdata.d,
                          item: Appdata.day
                              .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 5, right: 5),
                                    child: FittedBox(
                                      child: Text(value),
                                    ),
                                  )))
                              .toList(), onchang: (value) {
                        setState(() {
                          Appdata.d = value as String?;
                        });
                      }),
                      dropdownInput(context,
                          dopdown: Appdata.m,
                          item: Appdata.month
                              .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 5, right: 5),
                                    child: FittedBox(
                                      child: Text(value),
                                    ),
                                  )))
                              .toList(), onchang: (value) {
                        setState(() {
                          Appdata.m = value as String?;
                        });
                      }),
                      dropdownInput(context,
                          dopdown: Appdata.y,
                          item: Appdata.year
                              .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 5, right: 5),
                                    child: FittedBox(
                                      child: Text(value),
                                    ),
                                  )))
                              .toList(), onchang: (value) {
                        setState(() {
                          Appdata.y = value as String?;
                        });
                      }),
                    ],
                  ),
                ),
              ),
          
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100,right: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => V1(
                                      count: int.parse(p3.text),
                                      money: double.parse(p1.text),
                                      listinterest: Appdata.colculaterPasy(
                                          count: int.parse(p3.text),
                                          interest: double.parse(p2.text),
                                          month: Appdata.d1(Appdata.m.toString()),
                                          money: double.parse(p1.text)),
                                      calfinishcount: Appdata.moneyAll(
                                          double.parse(p1.text),
                                          double.parse(p2.text),
                                          double.parse(p3.text))))).then((value) {
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        p1.clear();
                        p2.clear();
                        p3.clear();
                        Appdata.d = null;
                        Appdata.m = null;
                        Appdata.y = null;
                      });
                    },
                    child: const Text('ล้างข้อมูล'),
                  ),
                ),
              ]),
            ])),
          ]),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Image.asset(
              'assets/images/หน้าแรก.png',
              width: 300,
              height: 200,
            ),
          ),
        ]),
      ),
    );
  }
}
