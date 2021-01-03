import 'package:flutter/material.dart';
import 'package:json_to_form/json_schema.dart';
import 'package:simon/generators/form_decorations.dart';
import 'package:simon/generators/form_json.dart';

class ServiceForm extends StatefulWidget {
  ServiceForm({Key key, this.json}) : super(key: key);
  final String json;

  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  dynamic response;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/back2.jpg"),
          //     fit: BoxFit.fill,
          //   ),

          // ),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.black.withOpacity(.4),
              child: Column(
                children: <Widget>[
                  JsonSchema(
                    form: form,
                    onChanged: (resp) {
                      setState(() {
                        response = resp;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
