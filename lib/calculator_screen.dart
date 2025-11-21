import 'package:flutter/material.dart';
import 'calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = "0";
  double? _num1;
  String? _operation;

  // === Colors matching your sample image ===
  final Color bgDark = const Color(0xFF1A1A1A);
  final Color btnNumber = const Color(0xFF2B2B2B);
  final Color btnOperator = const Color(0xFF3D503A);
  final Color btnEqual = const Color(0xFF2F7A39);
  final Color btnClear = const Color(0xFFB44343);

  // -------------------- INPUT NUMBER --------------------
  void _onNumber(String number) {
    setState(() {
      if (_input == "0") {
        _input = number;
      } else {
        _input += number;
      }
    });
  }

  // -------------------- DECIMAL --------------------
  void _onDecimal() {
    if (_input.contains(".")) return;
    setState(() => _input += ".");
  }

  // -------------------- OPERATION --------------------
  void _onOperation(String op) {
    setState(() {
      if (_operation != null) {
        _calculate();
      }
      _num1 = double.tryParse(_input);
      _operation = op;
      _input = "0";
    });
  }

  // -------------------- CALCULATE --------------------
  void _calculate() {
    if (_operation == null || _num1 == null) return;

    final double num2 = double.tryParse(_input) ?? 0;
    double result = 0;

    switch (_operation) {
      case "+":
        result = _num1! + num2;
        break;
      case "-":
        result = _num1! - num2;
        break;
      case "×":
        result = _num1! * num2;
        break;
      case "÷":
        if (num2 == 0) {
          _input = "Error";
          _num1 = null;
          _operation = null;
          return;
        }
        result = _num1! / num2;
        break;
    }

    setState(() {
      _input = result.toString();
      _num1 = result;
      _operation = null;
    });
  }

  // -------------------- CLEAR --------------------
  void _clear() {
    setState(() {
      _input = "0";
      _num1 = null;
      _operation = null;
    });
  }

  // -------------------- CE (Backspace) --------------------
  void _backspace() {
    setState(() {
      if (_input.length > 1) {
        _input = _input.substring(0, _input.length - 1);
      } else {
        _input = "0";
      }
    });
  }

  // -------------------- +/- --------------------
  void _toggleSign() {
    setState(() {
      if (_input.startsWith("-")) {
        _input = _input.substring(1);
      } else {
        _input = "-$_input";
      }
    });
  }

  // -------------------- PERCENT --------------------
  void _percent() {
    final value = double.tryParse(_input) ?? 0;
    setState(() => _input = (value / 100).toString());
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: bgDark,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // DISPLAY AREA (Expanded để không bị ép lên trên)
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  _input,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BUTTON GRID (chiếm phần dưới)
            Expanded(
              flex: 5,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
                children: [
                  CalculatorButton(label: "C", color: btnClear, onTap: _clear),
                  CalculatorButton(label: "()", color: btnOperator, onTap: () {}),
                  CalculatorButton(label: "%", color: btnOperator, onTap: _percent),
                  CalculatorButton(label: "÷", color: btnOperator, onTap: () => _onOperation("÷")),

                  CalculatorButton(label: "7", color: btnNumber, onTap: () => _onNumber("7")),
                  CalculatorButton(label: "8", color: btnNumber, onTap: () => _onNumber("8")),
                  CalculatorButton(label: "9", color: btnNumber, onTap: () => _onNumber("9")),
                  CalculatorButton(label: "×", color: btnOperator, onTap: () => _onOperation("×")),

                  CalculatorButton(label: "4", color: btnNumber, onTap: () => _onNumber("4")),
                  CalculatorButton(label: "5", color: btnNumber, onTap: () => _onNumber("5")),
                  CalculatorButton(label: "6", color: btnNumber, onTap: () => _onNumber("6")),
                  CalculatorButton(label: "-", color: btnOperator, onTap: () => _onOperation("-")),

                  CalculatorButton(label: "1", color: btnNumber, onTap: () => _onNumber("1")),
                  CalculatorButton(label: "2", color: btnNumber, onTap: () => _onNumber("2")),
                  CalculatorButton(label: "3", color: btnNumber, onTap: () => _onNumber("3")),
                  CalculatorButton(label: "+", color: btnOperator, onTap: () => _onOperation("+")),

                  CalculatorButton(label: "+/-", color: btnNumber, onTap: _toggleSign),
                  CalculatorButton(label: "0", color: btnNumber, onTap: () => _onNumber("0")),
                  CalculatorButton(label: ".", color: btnNumber, onTap: _onDecimal),
                  CalculatorButton(label: "=", color: btnEqual, onTap: _calculate),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}