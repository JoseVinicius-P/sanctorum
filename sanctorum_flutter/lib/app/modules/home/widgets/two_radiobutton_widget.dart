
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanctorum_flutter/app/shared/my_text_styles.dart';

class TwoRadioButtonWidget<T> extends StatefulWidget {
  const TwoRadioButtonWidget({super.key, required this.initialValue, required this.text1, required this.text2, required this.value1, required this.value2, required this.onChanged, this.title});

  final T initialValue;
  final String text1, text2;
  final T value1, value2;
  final void Function(T?) onChanged;
  final String? title;

  @override
  State<TwoRadioButtonWidget<T>> createState() => _TwoRadioButtonWidgetState<T>();
}

class _TwoRadioButtonWidgetState<T> extends State<TwoRadioButtonWidget<T>> {
  late T? value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if(widget.title != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.title!, style: MyTextStyles.defaultText, textAlign: TextAlign.start,),
            ],
          ),
        if(widget.title != null)
          const SizedBox(height: 5,),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: RadioListTile<T>(
                selected: widget.initialValue == widget.value1,
                visualDensity: VisualDensity.compact,
                title: Text(widget.text1),
                dense: true,
                contentPadding: const EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                mouseCursor: SystemMouseCursors.click,
                value: widget.value1,
                groupValue: value,
                onChanged: (T? value) {
                  setState(() {
                    this.value = value;
                  });
                  widget.onChanged(this.value);
                },
              ),
            ),
            Expanded(
              child: RadioListTile<T>(
                selected: widget.initialValue == widget.value2,
                visualDensity: VisualDensity.compact,
                dense: true,
                contentPadding: const EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                mouseCursor: SystemMouseCursors.click,
                title: Text(widget.text2),
                value: widget.value2,
                groupValue: value,
                onChanged: (T? value) {
                  setState(() {
                    this.value = value;
                  });
                  widget.onChanged(this.value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}