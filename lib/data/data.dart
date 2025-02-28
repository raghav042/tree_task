import '../model/tree_node.dart';

final nodes = [
  TreeNode(
    title: "Parent 1",
    children: [
      TreeNode(
        title: "Parent 2",
        children: [
          TreeNode(
            title: "Child 1",
          ),
          TreeNode(
            title: "Child 2",
          ),
          TreeNode(
            title: "Child 3",
            children: [
              TreeNode(
                title: "Child 4",
              ),
              TreeNode(
                title: "Child 5",
              ),
            ],
          ),
        ],
      ),
      TreeNode(
        title: "Parent 3",
      ),
      TreeNode(
        title: "Parent 4",
      ),
      TreeNode(
        title: "Parent 5",
      ),
    ],
  ),
];
