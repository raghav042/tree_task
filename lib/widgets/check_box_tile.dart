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
  final VoidCallback onChanged;
  final int level;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const size = 20.0;
    const borderRadius = BorderRadius.all(Radius.circular(3.0));
    return Row(
      children: [
        SizedBox(width: level * 26.0),
        IconButton(
          onPressed: onChanged,
          icon: Container(
            height: size,
            width: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: checkBoxState == CheckBoxState.unselected
                    ? themeData.unselectedWidgetColor
                    : themeData.primaryColor,
                width: 2.0,
              ),
              borderRadius: borderRadius,
              color: checkBoxState == CheckBoxState.unselected
                  ? Colors.transparent
                  : themeData.primaryColor,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 260),
              child: checkBoxState == CheckBoxState.unselected
                  ? const SizedBox(height: size, width: size)
                  : FittedBox(
                      key: ValueKey(checkBoxState.name),
                      fit: BoxFit.scaleDown,
                      child: Center(
                        child: checkBoxState == CheckBoxState.partial
                            ? Container(
                                height: 1.8,
                                width: 12.0,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: borderRadius,
                                ),
                              )
                            : const Icon(Icons.check, color: Colors.white),
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Text(title),
      ],
    );
  }
}
