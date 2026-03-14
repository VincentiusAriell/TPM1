import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  String equation = "0";
  String result = "0";

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return ElevatedButton(
      onPressed: () {

        setState(() {

          if (btntxt == "AC") {
            equation = "0";
            result = "0";
          }

          else if (btntxt == "=") {

            try {
              Parser p = Parser();
              Expression exp = p.parse(equation);
              ContextModel cm = ContextModel();
              double eval = exp.evaluate(EvaluationType.REAL, cm);

              result = eval.toString();
              equation = result;
            } catch (e) {
              equation = "Error";
            }

          }

          else {

            if (equation == "0") {
              equation = btntxt;
            } else {
              equation = equation + btntxt;
            }

          }

        });

      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor: btncolor,
      ),
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 35,
          color: txtcolor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    equation,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 80,
                    ),
                  ),
                )
              ],
            ),

            //operasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('AC', const Color.fromRGBO(33, 150, 243, 1), Colors.black),
                calcbutton('+', Colors.blue, Colors.white),
                calcbutton('-',  const Color.fromRGBO(33, 150, 243, 1), Colors.white),
              ],
            ),

            const SizedBox(height: 10),

            //nomer bawah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('7', Colors.blue, Colors.white),
                calcbutton('8', Colors.blue, Colors.white),
                calcbutton('9', Colors.blue, Colors.white),
              ],
            ),

            const SizedBox(height: 10),

            //nomer tengah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('4', Colors.blue, Colors.white),
                calcbutton('5', Colors.blue, Colors.white),
                calcbutton('6', Colors.blue, Colors.white),
              ],
            ),

            const SizedBox(height: 10),

            //nomor atas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('1', Colors.blue, Colors.white),
                calcbutton('2', Colors.blue, Colors.white),
                calcbutton('3', Colors.blue, Colors.white),
              ],
            ),

            const SizedBox(height: 10),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('0', Colors.blue, Colors.white),
                calcbutton('=', const Color.fromRGBO(255, 152, 0, 1), Colors.white),
              ],
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}