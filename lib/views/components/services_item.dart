import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simon/generators/form_decorations.dart';
import 'package:simon/models/service_model.dart';
import 'package:simon/views/components/forms/service_form.dart';

class ServicesItem extends StatelessWidget {
  const ServicesItem({Key key, this.service}) : super(key: key);

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          var route = MaterialPageRoute(builder: (c) => ServiceForm());
          Navigator.push(context, route);
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(100, 30),
            ),
          ),
          child: Container(
            color: Colors.transparent,
            constraints: BoxConstraints(
              minHeight: size.height / 4,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    //color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        service.imageUrl,
                        height: 60,
                        //color: Colors.brown,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            service.name,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            service.description,
                            style: TextStyle(color: Colors.black, fontSize: 10),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),
                        ButtonBar(
                          children: [
                            IconButton(
                                icon: Icon(FontAwesomeIcons.infoCircle),
                                onPressed: () {})
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
