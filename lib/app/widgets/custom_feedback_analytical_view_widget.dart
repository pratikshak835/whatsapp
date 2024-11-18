import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:whatsapp/app/widgets/common_container_for%20gauge.dart';

class CustomFeedbackAnalyticalViewWidget extends StatefulWidget {
  const CustomFeedbackAnalyticalViewWidget({super.key});

  @override
  State<CustomFeedbackAnalyticalViewWidget> createState() =>
      _CustomFeedbackAnalyticalViewWidgetState();
}

class _CustomFeedbackAnalyticalViewWidgetState
    extends State<CustomFeedbackAnalyticalViewWidget> {
  double _pointerValue = 75;
  @override
  Widget build(BuildContext context) {
    return CommonContainerForGauge(
      title: "Customer Feedback Analytical view",
      pointerValue: _pointerValue,
      onPointerTapped: (double value) {
        setState(() {
          _pointerValue = value;
        });
      },
      gaugeRanges: [
        GaugeRange(
            startValue: 0,
            endValue: 50,
            color: Colors.red,
            startWidth: 30,
            endWidth: 30),
        GaugeRange(
            startValue: 50,
            endValue: 80,
            color: Colors.orange,
            startWidth: 30,
            endWidth: 30),
        GaugeRange(
            startValue: 80,
            endValue: 100,
            color: Colors.green,
            startWidth: 30,
            endWidth: 30),
      ],
      gaugePointers: [
        RangePointer(
          gradient: const SweepGradient(
            colors: <Color>[Color(0xFFCC2B5E), Color(0xFF753A88)],
            stops: <double>[0.25, 0.75],
          ),
          value: _pointerValue,
          enableAnimation: true,
          width: 30,
        ),
      ],
      getGaugeText: (double value) => _getGaugeText(value),
    );
  }

  String _getGaugeText(double value) {
    if (value < 50) {
      return "Poor";
    } else if (value < 80) {
      return "Medium";
    } else {
      return "High";
    }
  }
}
