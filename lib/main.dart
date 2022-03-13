import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const CalcPage(),
    );
  }
}

class CalcPage extends StatefulWidget {
  const CalcPage({Key? key}) : super(key: key);

  @override
  _CalcPageState createState() => _CalcPageState();
}
String out = "";
List<double> intArr = [];
List<String> operatorArr = [];
class calculation{


  String calc(String text){
    if(operatorArr.isEmpty){
      if(text =="C"){
        out = '';
        intArr.clear();
        operatorArr.clear();
        return out;
      }
      if(text == "*"){
        intArr.add(double.parse(out));
        operatorArr.add(text);
        out = "";
        return out;
      }
      if(text == "-"){
        intArr.add(double.parse(out));
        operatorArr.add(text);
        out = "";
        return out;
      }
      if(text == "/"){
        intArr.add(double.parse(out));
        operatorArr.add(text);
        out = "";
        return out;
      }
      if(text == "+"){
        intArr.add(double.parse(out));
        operatorArr.add(text);
        out = "";
        return out;
      }


      else{
        out += text;
        return out;
      }

    }else{
      if(operatorArr.first == "*"){
        out = (intArr[0] * int.parse(text)).toString();
        operatorArr.clear();
        intArr.clear();
        intArr.add(double.parse(out));
        return out;
      }
      if(operatorArr.first == "/"){
        out = (intArr[0] / int.parse(text)).toString();

        operatorArr.clear();
        intArr.clear();
        intArr.add(double.parse(out));
        return out;

      }
      if(operatorArr.first == "-"){
        out = (intArr[0] - int.parse(text)).toString();
        operatorArr.clear();
        intArr.clear();
        intArr.add(double.parse(out));
        return out;

      }
      if(operatorArr.first == "+"){
        out = (intArr[0] + int.parse(text)).toString();
        operatorArr.clear();
        intArr.clear();
        intArr.add(double.parse(out));
        return out;

      }
      else {
        return out;
      }


    }


  }
}
class _CalcPageState extends State<CalcPage> {
  String text = "";
  calculation cal = calculation();
  Widget calculationWidget(String textCalcButton, Color colorButton) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: colorButton,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      ),

      onPressed: () {
        setState(() {
         text = cal.calc(textCalcButton);
        });

      },
      child: Text(
        textCalcButton,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: calculationWidget('C', Colors.grey)),
                    Expanded(child: calculationWidget('?', Colors.grey)),
                    Expanded(child: calculationWidget('%', Colors.grey)),
                    Expanded(
                        child: calculationWidget('/', Colors.orangeAccent)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: calculationWidget('7', Colors.grey)),
                    Expanded(child: calculationWidget('8', Colors.grey)),
                    Expanded(child: calculationWidget('9', Colors.grey)),
                    Expanded(
                        child: calculationWidget('*', Colors.orangeAccent)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: calculationWidget('4', Colors.grey)),
                    Expanded(child: calculationWidget('5', Colors.grey)),
                    Expanded(child: calculationWidget('6', Colors.grey)),
                    Expanded(
                        child: calculationWidget('-', Colors.orangeAccent)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: calculationWidget('1', Colors.grey)),
                    Expanded(child: calculationWidget('2', Colors.grey)),
                    Expanded(child: calculationWidget('3', Colors.grey)),
                    Expanded(
                        child: calculationWidget('+', Colors.orangeAccent)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: calculationWidget('0', Colors.grey)),
                    calculationWidget('.', Colors.grey),
                    calculationWidget('=', Colors.orangeAccent),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
