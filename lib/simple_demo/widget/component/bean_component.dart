import 'package:diagram_editor/diagram_editor.dart';
import 'package:diagram_editor_apps/simple_demo/widget/component/base_component_body.dart';
import 'package:flutter/material.dart';

class BeanBody extends StatelessWidget {
  final ComponentData componentData;

  const BeanBody({
    Key key,
    this.componentData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseComponentBody(
      componentData: componentData,
      componentPainter: BeanPainter(
        color: componentData.data.color,
        borderColor: componentData.data.borderColor,
        borderWidth: 2.0,
      ),
    );
  }
}

class BeanPainter extends CustomPainter {
  final Color color;
  final Color borderColor;
  final double borderWidth;
  Size componentSize;

  BeanPainter({
    this.color = Colors.grey,
    this.borderColor = Colors.black,
    this.borderWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    componentSize = size;

    Path path = componentPath();

    canvas.drawPath(path, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = borderColor
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = componentPath();
    return path.contains(position);
  }

  Path componentPath() {
    Path path = Path();
    path.moveTo(componentSize.width / 5, 0);
    path.lineTo(4 * componentSize.width / 5, 0);
    path.quadraticBezierTo(
      componentSize.width,
      componentSize.height / 6,
      componentSize.width,
      componentSize.height / 2,
    );
    path.quadraticBezierTo(
      componentSize.width,
      5 * componentSize.height / 6,
      4 * componentSize.width / 5,
      componentSize.height,
    );
    path.lineTo(componentSize.width / 5, componentSize.height);
    path.quadraticBezierTo(
      0,
      5 * componentSize.height / 6,
      0,
      componentSize.height / 2,
    );
    path.quadraticBezierTo(
      0,
      componentSize.height / 6,
      componentSize.width / 5,
      0,
    );
    path.close();
    return path;
  }
}
