import 'package:diagram_editor/diagram_editor.dart';
import 'package:diagram_editor_apps/simple_diagram_editor/data/custom_link_data.dart';
import 'package:diagram_editor_apps/simple_diagram_editor/policy/custom_policy.dart';
import 'package:flutter/material.dart';

mixin MyComponentPolicy implements ComponentPolicy, CustomStatePolicy {
  @override
  onComponentTap(String componentId) {
    if (isMultipleSelectionOn) {
      if (multipleSelected.contains(componentId)) {
        removeComponentFromMultipleSelection(componentId);
        hideComponentHighlight(componentId);
      } else {
        addComponentToMultipleSelection(componentId);
        highlightComponent(componentId);
      }
    } else {
      hideAllHighlights();

      if (isReadyToConnect) {
        isReadyToConnect = false;
        bool connected = connectComponents(selectedComponentId, componentId);
        if (connected) {
          print('connected');
          selectedComponentId = null;
        } else {
          print('not connected');
          selectedComponentId = componentId;
          highlightComponent(componentId);
        }
      } else {
        selectedComponentId = componentId;
        highlightComponent(componentId);
      }
    }
  }

  late Offset lastFocalPoint;

  @override
  onComponentScaleStart(componentId, details) {
    lastFocalPoint = details.localFocalPoint;

    hideLinkOption();
    if (isMultipleSelectionOn) {
      addComponentToMultipleSelection(componentId);
      highlightComponent(componentId);
    }
  }

  @override
  onComponentScaleUpdate(componentId, details) {
    Offset positionDelta = details.localFocalPoint - lastFocalPoint;
    if (isMultipleSelectionOn) {
      multipleSelected.forEach((componentId) {
        if (componentId == null) return;
        var cmp = canvasReader.model.getComponent(componentId);
        canvasWriter.model.moveComponent(componentId, positionDelta);
        cmp.connections.forEach((connection) {
          if (connection is ConnectionOut && multipleSelected.contains(connection.otherComponentId)) {
            canvasWriter.model.moveAllLinkMiddlePoints(connection.connectionId, positionDelta);
          }
        });
      });
    } else {
      canvasWriter.model.moveComponent(componentId, positionDelta);
    }
    lastFocalPoint = details.localFocalPoint;
  }

  bool connectComponents(String? sourceComponentId, String targetComponentId) {
    if (sourceComponentId == null) {
      return false;
    }
    if (sourceComponentId == targetComponentId) {
      return false;
    }
    if (canvasReader.model
        .getComponent(sourceComponentId)
        .connections
        .any((connection) => (connection is ConnectionOut) && (connection.otherComponentId == targetComponentId))) {
      return false;
    }

    canvasWriter.model.connectTwoComponents(
      sourceComponentId: sourceComponentId,
      targetComponentId: targetComponentId,
      linkStyle: LinkStyle(
        arrowType: ArrowType.pointedArrow,
        lineWidth: 1.5,
        backArrowType: ArrowType.centerCircle,
      ),
      data: MyLinkData(),
    );

    return true;
  }
}
