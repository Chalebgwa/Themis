import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) validator;
  final String label;
  final bool hide;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final TextInputType keyboardType;

  TextInput({
    Key key,
    this.controller,
    this.validator,
    this.label,
    this.hide = false,
    this.textAlign,
    this.textStyle = const TextStyle(color: Colors.white),
    this.keyboardType,
  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<TextInput> {
  Icon _ok = Icon(
    Icons.check_circle,
    color: Colors.green,
  );

  Icon _wrong = Icon(
    Icons.close,
    color: Colors.red,
  );

  bool valid = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: widget.validator,
        textAlign: widget.textAlign ?? TextAlign.start,
        style: widget.textStyle,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onChanged: (value) {
          if (widget.validator(widget.controller.text) != null) {
            setState(() {
              valid = false;
            });
          } else {
            setState(() {
              valid = true;
            });
          }
        },
        obscureText: widget.hide,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: valid ? _ok : _wrong,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
              gapPadding: 10.0),
          hintText: widget.label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintStyle: TextStyle(color: Colors.white),
          //fillColor: Colors.white.withOpacity(.2),
          filled: true,
        ),
      ),
    );
  }
}
