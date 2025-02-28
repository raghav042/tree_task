import 'package:flutter/material.dart';

import '../../core/enum/check_box_state.dart';
import '../../model/tree_node.dart';
import '../../widgets/check_box_tile.dart';

class TreeView extends StatefulWidget {
  const TreeView({
    super.key,
    required this.nodes,
    this.level = 0,
    required this.onChanged,
  });

  final List<TreeNode> nodes;
  final int level;
  final void Function(List<TreeNode> newNodes) onChanged;

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  late List<TreeNode> nodes;

  @override
  void initState() {
    super.initState();
    nodes = widget.nodes;
  }

  TreeNode _unselectAllSubTree(TreeNode node) {
    final treeNode = node.copyWith(
      isSelected: false,
      children: node.children.isEmpty
          ? null
          : node.children.map((e) => _unselectAllSubTree(e)).toList(),
    );
    return treeNode;
  }

  TreeNode _selectAllSubTree(TreeNode node) {
    final treeNode = node.copyWith(
      isSelected: true,
      children: node.children.isEmpty
          ? null
          : node.children.map((e) => _selectAllSubTree(e)).toList(),
    );
    return treeNode;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.nodes != nodes) {
      nodes = widget.nodes;
    }

    return ListView.builder(
      itemCount: nodes.length,
      physics: widget.level != 0 ? const NeverScrollableScrollPhysics() : null,
      shrinkWrap: widget.level != 0,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CheckBoxTile(
              onChanged: (v) {
                switch (nodes[index].checkBoxState) {
                  case CheckBoxState.selected:
                    nodes[index] = _unselectAllSubTree(nodes[index]);
                    break;
                  case CheckBoxState.unselected:
                    nodes[index] = _selectAllSubTree(nodes[index]);
                    break;
                  // case CheckBoxState.partial:
                  //   nodes[index] = _unselectAllSubTree(nodes[index]);
                  //   break;
                }
                if (widget.level == 0) {
                  setState(() {});
                }
                widget.onChanged(nodes);
              },
              title: nodes[index].title,
              checkBoxState: nodes[index].checkBoxState,
              level: widget.level,
            ),
            buildTree(index),
          ],
        );
      },
    );
  }

  Widget buildTree(int index) {
    return TreeView(
      nodes: nodes[index].children,
      level: widget.level + 1,
      onChanged: (newNodes) {
        bool areAllItemsSelected =
            !nodes[index].children.any((element) => !element.isSelected);

        nodes[index] = nodes[index].copyWith(
          isSelected: areAllItemsSelected,
          children: newNodes,
        );

        widget.onChanged(nodes);
        if (widget.level == 0) {
          setState(() {});
        }
      },
    );
  }
}
