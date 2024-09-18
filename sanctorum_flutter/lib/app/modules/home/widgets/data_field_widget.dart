import 'package:flutter/material.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/checkbox_widget.dart';
import 'package:sanctorum_flutter/app/shared/my_text_styles.dart';
import 'package:sanctorum_flutter/app/shared/utilities/my_masks.dart';
import 'package:sanctorum_flutter/app/shared/utilities/validator.dart';
import 'package:sanctorum_flutter/app/shared/widgets/text_field_widget.dart';

class DataFieldWidget extends StatefulWidget {
  DataFieldWidget({
    super.key,
    Date? date,
    required this.update, this.title,
  }) : date = date ?? Date(year: 0, month: 0, day: 0);

  final Date date;
  final String? title;
  final void Function(Date?) update;

  @override
  State<DataFieldWidget> createState() => _DataFieldWidgetState();
}

class _DataFieldWidgetState extends State<DataFieldWidget> {
  late Date date;

  @override
  void initState() {
    date = widget.date;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(widget.title != null)
        Text(widget.title!, style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
        if(widget.title != null)
        const SizedBox(height: 10,),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: TextFieldWidget(
                isVerticalDense: true,
                hint: 'Dia',
                text: date.day.toString().padLeft(2, '0'),
                validator: DayValidator(),
                maskFormatter: MyMasks.dayMaskFormatter,
                onChanged: (text){
                  setState(() {
                    date.day = int.parse(text ?? '0');
                  });
                  widget.update(date);
                },
              ),
            ),
            const SizedBox(width: 15,),
            Flexible(
              child: TextFieldWidget(
                isVerticalDense: true,
                hint: 'Mês',
                text: date.month.toString().padLeft(2, '0'),
                validator: MonthValidator(),
                maskFormatter: MyMasks.monthMaskFormatter,
                onChanged: (text){
                  setState(() {
                    date.month = int.parse(text ?? '0');
                  });
                  widget.update(date);
                },
              ),
            ),
            const SizedBox(width: 15,),
            Flexible(
              child: TextFieldWidget(
                isVerticalDense: true,
                hint: 'Ano',
                text: date.year.abs().toString().padLeft(4, '0'),
                validator: YearValidator(),
                maskFormatter: MyMasks.yearMaskFormatter,
                onChanged: (text){
                  setState(() {
                    date.year = int.parse(text ?? '0');
                  });
                  widget.update(date);
                },
              ),
            ),
          ],
        ),
        if(date.year != 0)
          CheckboxWidget(
              text: 'Antes de Cristo',
              checked: date.year < 0,
              onChanged: (checked){
                var year = date.year;
                if(checked ?? false){
                  if(year > 0){
                    date.year = year * -1;
                  }
                }else {
                  if (year < 0) {
                    date.year = year * -1;
                  }
                }
                widget.update(date);
              }
          )
      ],
    );
  }
}