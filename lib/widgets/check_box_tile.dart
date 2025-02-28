import 'package:flutter/material.dart';
import '../core/enum/check_box_state.dart';

class CheckBoxTile extends StatelessWidget {
  const CheckBoxTile({
    super.key,
    required this.title,
    required this.checkBoxState,
    required this.onChanged,
    required this.level,
  });

  final String title;
  final CheckBoxState checkBoxState;
  final void Function(bool?)? onChanged;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: level * 26.0),
        Checkbox(
          value: checkBoxState == CheckBoxState.selected,
          onChanged: onChanged,
        ),
        const SizedBox(width: 8.0),
        Text(title),
      ],
    );
  }
}
