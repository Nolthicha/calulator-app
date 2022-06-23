import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:collection/src/list_extensions.dart';
import 'package:intersperse/intersperse.dart';

class CalulatorPage extends StatefulWidget {
  const CalulatorPage({Key? key}) : super(key: key);

  @override
  State<CalulatorPage> createState() => _CalulatorPageState();
}

class _CalulatorPageState extends State<CalulatorPage> {
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
        style: NeumorphicStyle(
          depth: -2,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(20),
          ),
        ),
        child: const Text(''),
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
          onPressed: () {},
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
          onPressed: () {},
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
