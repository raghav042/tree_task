import '../core/enum/check_box_state.dart';

class TreeNode {
  final String title;
  final bool isSelected;
  final CheckBoxState checkBoxState;
  final List<TreeNode> children;

  TreeNode({
    required this.title,
    this.isSelected = false,
    this.children = const <TreeNode>[],
  }) : checkBoxState = isSelected
            ? CheckBoxState.selected
            : (children.any((element) =>
                    element.checkBoxState != CheckBoxState.unselected)
                ? CheckBoxState.partial
                : CheckBoxState.unselected);

  TreeNode copyWith({
    String? title,
    bool? isSelected,
    List<TreeNode>? children,
  }) {
    return TreeNode(
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
      children: children ?? this.children,
    );
  }
}
