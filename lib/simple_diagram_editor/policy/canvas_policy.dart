import 'package:diagram_editor/diagram_editor.dart';
import 'package:fdl_demo_app_2/simple_diagram_editor/policy/custom_policy.dart';

mixin MyCanvasPolicy implements CanvasPolicy, CustomStatePolicy {
  @override
  onCanvasTap() {
    multipleSelected = [];

    if (isReadyToConnect) {
      isReadyToConnect = false;
      canvasWriter.model.updateComponent(selectedComponentId);
    } else {
      selectedComponentId = null;
      hideAllHighlights();
    }
  }
}
