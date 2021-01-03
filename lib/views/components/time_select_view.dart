import 'package:flutter/material.dart';
import 'package:simon/models/slot.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as rs;
import 'package:flutter_xlider/flutter_xlider.dart' as xs;

class TimeSelect extends StatefulWidget {
  const TimeSelect({Key key, this.slot}) : super(key: key);
  final Slot slot;

  @override
  _TimeSelectState createState() => _TimeSelectState();
}

class _TimeSelectState extends State<TimeSelect> {
  double _start = 0;
  double _end = 10;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: xs.FlutterSlider(
              //axis: Axis.vertical,
              values: [
                _start,
                _end,
              ],

              touchSize: 20,
              visibleTouchArea: true,
              step: xs.FlutterSliderStep(
                step: 15,
              ),
              max: 60,
              hatchMark: xs.FlutterSliderHatchMark(
                bigLine: xs.FlutterSliderSizedBox(height: 200, width: 20),
                density: 1,
                //smallLine: xs.FlutterSliderSizedBox(height: 30, width: 20),
                displayLines: true,
              ),
              min: 0,
              jump: true,
              rangeSlider: true,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                setState(() {
                  _start = lowerValue;
                  _end = upperValue;
                });
              },
              trackBar: xs.FlutterSliderTrackBar(
                  activeTrackBarHeight: 100,
                  activeTrackBar: BoxDecoration(color: Colors.black)),
            ),
          )),
    );
  }
}
