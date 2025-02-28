import 'package:flutter/material.dart';
import 'package:tree_task/features/about_screen.dart';

import '../../data/data.dart';
import 'tree_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutScreen()));
            },
            child: const Text("Tree Structure"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: TreeView(
          onChanged: (newNodes) {},
          nodes: nodes,
        ),
      ),
    );
  }
}
