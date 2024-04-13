import 'package:diagram_editor_apps/complex_example/complex_editor.dart';
import 'package:diagram_editor_apps/grid_example/grid_editor.dart';
import 'package:diagram_editor_apps/hierarchical_example/hierarchical_editor.dart';
import 'package:diagram_editor_apps/ports_example/ports_editor.dart';
import 'package:diagram_editor_apps/pub_example/pub_editor.dart';
import 'package:diagram_editor_apps/simple_diagram_editor/widget/editor.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: !kIsWeb,
      showPerformanceOverlay: false,
      title: 'Diagram editor',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/editor': (context) => SimpleDemo(),
        '/pub_example': (context) => PubDemo(),
        '/ports': (context) => PortDemo(),
        '/hierarchical': (context) => HierarchicalDemo(),
        '/complex': (context) => ComplexDemo(),
        '/grid': (context) => GridDemo(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  Future<void> _launchUrl(String urlString) async {
    final url = Uri.tryParse(urlString);
    if (url == null) return;
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Examples of usage of Flutter diagram_editor library.'),
              SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('library GitHub'),
                onPressed: () {
                  _launchUrl('https://github.com/Arokip/fdl');
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('library'),
                onPressed: () {
                  _launchUrl('https://pub.dev/packages/diagram_editor');
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('Simple editor'),
                onPressed: () {
                  Navigator.pushNamed(context, '/editor');
                },
              ),
              SizedBox(height: 40),
              Text('More examples:'),
              SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('pub.dev example'),
                onPressed: () {
                  Navigator.pushNamed(context, '/pub_example');
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('port example'),
                onPressed: () {
                  Navigator.pushNamed(context, '/ports');
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('hierarchical components example'),
                onPressed: () {
                  Navigator.pushNamed(context, '/hierarchical');
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('complex widget components'),
                onPressed: () {
                  Navigator.pushNamed(context, '/complex');
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('grid snapping example'),
                onPressed: () {
                  Navigator.pushNamed(context, '/grid');
                },
              ),
              SizedBox(height: 40),
              Text('link to ETL app:'),
              SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('ETL'),
                onPressed: () {
                  _launchUrl('https://arokip.github.io/etl_diagram_editor');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SimpleDemoEditor(),
      ),
    );
  }
}

class PubDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PubDiagramEditor(),
      ),
    );
  }
}

class PortDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PortsDiagramEditor(),
      ),
    );
  }
}

class HierarchicalDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: HierarchicalDiagramEditor(),
      ),
    );
  }
}

class ComplexDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ComplexDiagramEditor(),
      ),
    );
  }
}

class GridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridDiagramEditor(),
      ),
    );
  }
}
