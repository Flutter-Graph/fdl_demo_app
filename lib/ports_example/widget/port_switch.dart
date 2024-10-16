import 'package:diagram_editor_apps/ports_example/policy/policy_set.dart';
import 'package:flutter/material.dart';

class PortSwitch extends StatefulWidget {
  final MyPolicySet policySet;

  const PortSwitch({super.key, required this.policySet});

  @override
  PortSwitchState createState() => PortSwitchState();
}

class PortSwitchState extends State<PortSwitch> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 100,
      child: GestureDetector(
        onTap: () {
          widget.policySet.switchPortsVisibility();
          setState(() {});
        },
        child: Container(
          width: 96,
          height: 32,
          color: Colors.amber,
          child: Center(child: Text(widget.policySet.arePortsVisible ? 'hide ports' : 'show ports')),
        ),
      ),
    );
  }
}
