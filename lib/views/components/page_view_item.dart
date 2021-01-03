import 'package:flutter/material.dart';
import 'package:simon/views/components/text_inputs.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key key, @required this.question, @required this.inputs})
      : super(key: key);

  final String question;
  final List<TextInput> inputs;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: inputs,
      ),
    );
  }
}
