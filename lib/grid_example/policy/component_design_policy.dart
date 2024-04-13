import 'package:diagram_editor/diagram_editor.dart';
import 'package:fdl_demo_app_2/grid_example/widget/basic_component.dart';
import 'package:flutter/material.dart';

mixin MyComponentDesignPolicy implements ComponentDesignPolicy {
  @override
  Widget showComponentBody(ComponentData componentData) {
    return BasicComponent();
  }
}
