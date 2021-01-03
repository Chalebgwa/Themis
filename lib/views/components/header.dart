import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          text: "SIMON",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w100,
          ),
          children: [
            TextSpan(
              text: "LAW",
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
