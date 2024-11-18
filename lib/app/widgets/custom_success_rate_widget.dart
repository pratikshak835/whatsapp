import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:whatsapp/app/widgets/common_container_for%20gauge.dart';

class CustomSuccessRateWidget extends StatefulWidget {
  const CustomSuccessRateWidget({super.key});

  @override
  State<CustomSuccessRateWidget> createState() =>
      _CustomSuccessRateWidgetState();
}

class _CustomSuccessRateWidgetState extends State<CustomSuccessRateWidget> {
  double _pointerValue = 50;
  @override
  Widget build(BuildContext context) {
    return CommonContainerForGauge(
      title: "Success Rate",
      pointerValue: _pointerValue,
      onPointerTapped: (double value) {
        setState(() {
          _pointerValue = value;
        });
      },
      gaugeRanges: [
        GaugeRange(
            startValue: 0,
            endValue: 40,
            color: Colors.lightBlue[300]!,
            startWidth: 30,
            endWidth: 30),
        GaugeRange(
            startValue: 40,
            endValue: 80,
            color: Colors.blue,
            startWidth: 30,
            endWidth: 30),
        GaugeRange(
            startValue: 80,
            endValue: 100,
            color: Colors.blueAccent,
            startWidth: 30,
            endWidth: 30),
      ],
      gaugePointers: [
        MarkerPointer(
          value: _pointerValue,
          markerHeight: 20,
          markerWidth: 20,
          color: Colors.purpleAccent,
          elevation: 4,
        ),
      ],
      getGaugeText: (double value) => "${value.toStringAsFixed(0)}%",
    );
  }
}
