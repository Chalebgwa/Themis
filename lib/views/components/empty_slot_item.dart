import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simon/models/slot.dart';
import 'package:simon/views/components/bookings_form.dart';

class SlotItem extends StatefulWidget {
  const SlotItem({
    Key key,
    this.slot,
  }) : super(key: key);

  final Slot slot;

  @override
  _SlotItemState createState() => _SlotItemState();
}

class _SlotItemState extends State<SlotItem> {
  String _formatDate(DateTime date) {
    return DateFormat.Hm().format(date);
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).accentColor;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        color:
            widget.slot.iSbooked ? accentColor.withOpacity(.2) : Colors.white,
        child: InkWell(
          onTap: widget.slot.iSbooked
              ? null
              : () {
                  var route = MaterialPageRoute(
                    builder: (c) => BookingForm(
                      slot: widget.slot,
                    ),
                  );
                  Navigator.push(context, route);
                },
          child: Container(
              alignment: Alignment.center,
              height: 65, //5 * widget.slot.range.duration.inMinutes.toDouble(),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_formatDate(widget.slot.range.start)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_formatDate(widget.slot.range.end)),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: widget.slot.iSbooked ? Colors.red : Colors.green,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: widget.slot.iSbooked
                        ? ListTile(
                            trailing: CircleAvatar(
                              backgroundImage:
                                  AssetImage(widget.slot.appointment.imageUrl),
                            ),
                            title: Text(widget.slot.appointment.userid),
                            subtitle: Text(widget.slot.appointment.type
                                .toString()
                                .substring(16)),
                          )
                        : Container(
                            child: Text("Book appointment"),
                            alignment: Alignment.center,
                          ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildChip(int time) {
    return Chip(
      elevation: 5,
      label: Text(
        "$time",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
  }
}
