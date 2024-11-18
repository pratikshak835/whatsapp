import 'package:common_jds_flutter/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CommonContainerForGauge extends StatelessWidget {
  final String title;
  final double pointerValue;
  final Function(double) onPointerTapped;
  final List<GaugeRange> gaugeRanges;
  final List<GaugePointer> gaugePointers;
  final String Function(double) getGaugeText;

  const CommonContainerForGauge({
    super.key,
    required this.title,
    required this.pointerValue,
    required this.onPointerTapped,
    required this.gaugeRanges,
    required this.gaugePointers,
    required this.getGaugeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 380,
      width: 585,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CustomText(
            text: title,
            isRilFont: true,
            color: Colors.black,
            fontWeight: CustomFontWeight.bold,
            size: 18,
          ),
          Expanded(
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  canScaleToFit: true,
                  labelOffset: 30,
                  ranges: gaugeRanges,
                  pointers: gaugePointers,
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Text(
                        getGaugeText(pointerValue),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.5,
                    ),
                  ],
                  onAxisTapped: onPointerTapped,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
