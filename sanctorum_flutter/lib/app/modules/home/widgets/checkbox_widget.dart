import 'package:flutter/material.dart';
import 'package:sanctorum_flutter/app/shared/my_text_styles.dart';
import 'package:sanctorum_flutter/app/shared/utilities/my_colors.dart';

class CheckboxWidget extends StatefulWidget {
  final String text;
  const CheckboxWidget({
    super.key, this.onChanged, required this.checked, required this.text,
  });
  final Function(bool?)? onChanged;
  final bool checked;

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.checked;
  }


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0), // Personaliza o arredondamento
          ),
          side: const BorderSide(
            color: MyColors.primaryColor,
            width: 2,
          ),
          value: isChecked,
          activeColor: MyColors.primaryColor,
          onChanged: (isChecked){
            setState(() {
              this.isChecked = isChecked!;
            });
            widget.onChanged?.call(isChecked);
          },
        ),
        Text(
          widget.text,
          style: MyTextStyles.defaultText,
          maxLines: 1,
        ),
      ],
    );
  }
}