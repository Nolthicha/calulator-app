import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:collection/src/list_extensions.dart';
import 'package:intersperse/intersperse.dart';

class CalulatorPage extends StatefulWidget {
  const CalulatorPage({Key? key}) : super(key: key);

  @override
  State<CalulatorPage> createState() => _CalulatorPageState();
}

class _CalulatorPageState extends State<CalulatorPage> {
  num numberOne = 0;
  num numberTwo = 0;
  num result = 0;
  String finalResult = '';
  String operator = '';
  String preOperator = '';
  String displayText = '0';

  void _onPressButton(String textButton) {
    if (textButton == 'AC') {
      numberOne = 0;
      numberTwo = 0;
      result = 0;
      operator = '';
      preOperator = '';
      finalResult = '0';
    } else if (operator == '=' && textButton == '=') {
      if (preOperator == '+') {
        finalResult = _plus().toString();
      } else if (preOperator == '-') {
        finalResult = _minus().toString();
      } else if (preOperator == 'X') {
        finalResult = _multiply().toString();
      } else if (preOperator == '/') {
        finalResult = _divide().toString();
      }
    } else if (textButton == '+' ||
        textButton == '-' ||
        textButton == 'X' ||
        textButton == '/' ||
        textButton == '=') {
      if (numberOne == 0) {
        numberOne = result;
      } else {
        numberTwo = result;
      }

      if (operator == '+') {
        finalResult = _plus().toString();
      } else if (preOperator == '-') {
        finalResult = _minus().toString();
      } else if (preOperator == 'X') {
        finalResult = _multiply().toString();
      } else if (preOperator == '/') {
        finalResult = _divide().toString();
      }

      preOperator = operator;
      operator = textButton;
      result = 0;
    } else if (textButton == '%') {
      result = result / 100;
      finalResult = '$result';
    } else if (textButton == '.') {
      if (!result.toString().contains('.')) {
        result = num.parse(result.toString() + '.');
      }

      finalResult = '$result';
    } else if (textButton == '+/-') {
      if (result.toString().startsWith('-')) {
        result = num.parse(result.toString().substring(1));
      } else {
        result = num.parse('-' + result.toString());
      }

      finalResult = '$result';
    } else {
      result = num.parse('$result' + textButton);
      finalResult = '$result';
    }

    setState(() {
      displayText = finalResult;
    });
  }

  num _plus() {
    result = numberOne + numberTwo;
    numberOne = result;
    return result;
  }

  num _minus() {
    result = numberOne - numberTwo;
    numberOne = result;
    return result;
  }

  num _multiply() {
    result = numberOne * numberTwo;
    numberOne = result;
    return result;
  }

  num _divide() {
    result = numberOne / numberTwo;
    numberOne = result;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    const firstRow = ['AC', '+/-', '%', '/'];
    const secondRow = ['7', '8', '9', 'X'];
    const thirdRow = ['4', '5', '6', '-'];
    const fourthRow = ['1', '2', '3', '+'];

    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              _buildDisplay(),
              const SizedBox(height: 24),
              _buildRowButtons(firstRow),
              const SizedBox(height: 12),
              _buildRowButtons(secondRow),
              const SizedBox(height: 12),
              _buildRowButtons(thirdRow),
              const SizedBox(height: 12),
              _buildRowButtons(fourthRow),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildZeroButton(),
                  const SizedBox(width: 40),
                  _buildButton('.'),
                  const SizedBox(width: 20),
                  _buildButton('='),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDisplay() {
    return AspectRatio(
      aspectRatio: 5 / 4,
      child: Neumorphic(
        padding: const EdgeInsets.all(8),
        style: NeumorphicStyle(
          depth: -2,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(20),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            displayText,
            style: const TextStyle(fontSize: 54),
          ),
        ),
      ),
    );
  }

  Widget _buildRowButtons(List<String> texts) {
    return Row(
      children: texts
          .mapIndexed(
            (index, text) => _buildButton(text),
          )
          .intersperse(const SizedBox(width: 20))
          .toList(),
    );
  }

  Widget _buildZeroButton() {
    return Expanded(
      flex: 2,
      child: AspectRatio(
        aspectRatio: 2,
        child: NeumorphicButton(
          onPressed: () => _onPressButton('0'),
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(30),
            ),
          ),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '0',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: NeumorphicButton(
          onPressed: () => _onPressButton(text),
          style: const NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
