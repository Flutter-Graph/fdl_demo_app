import 'package:diagram_editor/diagram_editor.dart';
import 'package:fdl_demo_app_2/grid_example/policy/custom_policy.dart';
import 'package:flutter/material.dart';

mixin MyCanvasWidgetsPolicy implements CanvasWidgetsPolicy, CustomPolicy {
  @override
  List<Widget> showCustomWidgetsOnCanvasBackground(BuildContext context) {
    return [
      CustomPaint(
        size: Size.infinite,
        painter: GridPainter(
          horizontalGap: gridGap,
          verticalGap: gridGap,
          offset: canvasReader.state.position / canvasReader.state.scale,
          scale: canvasReader.state.scale,
          lineWidth: (canvasReader.state.scale < 1.0) ? canvasReader.state.scale : 1.0,
          matchParentSize: false,
          lineColor: Color(0xFF0D47A1),
        ),
      ),
    ];
  }
}
