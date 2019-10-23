import 'package:flutter/material.dart';

final TextStyle _hintStyle = TextStyle(
  fontSize: 16.0,
  color: const Color(0xFF9B9B9B),
);

final TextStyle _textFieldStyle = TextStyle(
  fontSize: 22.0,
  letterSpacing: 0.78,
  fontFamily: 'BebasNeueBold',
  color: const Color(0xFF4A4A4A),
);

class ColorfulTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final int maxLength;
  final int minLength;
  final Function legitimateCallback;
  final Function illegalCallback;

  ColorfulTextField({
    Key key,
    @required this.hintText,
    this.textEditingController,
    this.maxLength,
    this.minLength,
    this.legitimateCallback,
    this.illegalCallback,
  }) : super(key: key);

  @override
  _ColorfulTextFieldState createState() => _ColorfulTextFieldState();
}

class _ColorfulTextFieldState extends State<ColorfulTextField> {
  Color _inputColor;

  String get hintText => widget.hintText;

  TextEditingController get textEditingController =>
      widget.textEditingController;

  int get maxLength => widget.maxLength;

  int get minLength => widget.minLength;

  Function get legitimateCallback => widget.legitimateCallback;

  Function get illegalCallback => widget.illegalCallback;

  @override
  void initState() {
    super.initState();
    _inputColor = Color(0xFFC5C5C5);
  }

  @override
  void dispose() {
    textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: textEditingController,
          cursorColor: const Color(0xFFFF6B47),
          cursorWidth: 2.0,
          style: _textFieldStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: const Color(0xFFF4F3F4),
            isDense: true,
            hintStyle: _hintStyle,
            hintText: hintText,
          ),
          onChanged: (value) {
            int fieldValue = value.trim().length;
            if (fieldValue == 0) {
              _inputColor = Color(0xFFC5C5C5);
            } else if (fieldValue > maxLength) {
              _inputColor = Color(0xFFFF3E44);
            } else {
              _inputColor = Color(0xFF00CED2);
            }
            setState(() {});
            if (fieldValue > minLength - 1 && fieldValue < maxLength + 1) {
              legitimateCallback();
            } else {
              illegalCallback();
            }
          },
        ),
        Container(
          height: 2.0,
          color: const Color(0xFF242406),
        ),
        Container(
          height: 2.0,
          color: _inputColor,
        ),
      ],
    );
  }
}
