import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Screen"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: Text(structure)),
      ),
    );
  }
}

const String structure = '''
Parent 1
  |__Parent 2
       |__Child 1
       |__Child 2
       |__Child 3
            |__Child 4
            |__Child 5
  |__Parent 3
  |__Parent 4
  |__Parent 5          
''';
