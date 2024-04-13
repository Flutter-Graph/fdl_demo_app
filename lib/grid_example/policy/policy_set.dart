import 'package:diagram_editor/diagram_editor.dart';
import 'package:fdl_demo_app_2/grid_example/policy/canvas_policy.dart';
import 'package:fdl_demo_app_2/grid_example/policy/canvas_widget_policy.dart';
import 'package:fdl_demo_app_2/grid_example/policy/component_design_policy.dart';
import 'package:fdl_demo_app_2/grid_example/policy/component_policy.dart';
import 'package:fdl_demo_app_2/grid_example/policy/custom_policy.dart';

class MyPolicySet extends PolicySet
    with
        MyComponentDesignPolicy,
        MyCanvasPolicy,
        MyComponentPolicy,
        CustomPolicy,
        MyCanvasWidgetsPolicy,
        //
        CanvasControlPolicy {}
