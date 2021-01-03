import 'package:flutter/material.dart';

class FGridTile extends StatelessWidget {
  const FGridTile({Key key, this.label, this.iconData, this.color, this.page})
      : super(key: key);
  final String label;
  final IconData iconData;
  final Color color;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,

              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    color: Colors.white,
                    spreadRadius: .1,
                    offset: Offset(1, 1)),
                BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey.shade300,
                    spreadRadius: .1,
                    offset: Offset(-1, -1)),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              var route = MaterialPageRoute(builder: (_) => page);
              Navigator.push(context, route);
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Hero(
                      tag: label,
                      child: Icon(
                        iconData,
                        color: color,
                        size: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            color: color,
                            thickness: 3,
                            endIndent: 20,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeTile extends StatefulWidget {
  const TimeTile({Key key, this.time}) : super(key: key);

  final String time;

  @override
  _TimeTileState createState() => _TimeTileState();
}

class _TimeTileState extends State<TimeTile> {
  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      
      child: Container(
        height: 50,
        color: Colors.white,
        child: Text(widget.time),
      ),
    );
  }
}
