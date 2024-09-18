import 'package:flutter/material.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/checkbox_widget.dart';
import 'package:sanctorum_flutter/app/shared/my_text_styles.dart';
import 'package:sanctorum_flutter/app/shared/utilities/my_masks.dart';
import 'package:sanctorum_flutter/app/shared/utilities/validator.dart';
import 'package:sanctorum_flutter/app/shared/widgets/text_field_widget.dart';

class DataFieldWidget extends StatelessWidget {
  const DataFieldWidget({
    super.key,
    this.date,
    required this.update, this.title,
  });

  final Date? date;
  final String? title;
  final void Function(Date?) update;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(title != null)
        Text(title!, style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
        if(title != null)
        const SizedBox(height: 10,),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: TextFieldWidget(
                isVerticalDense: true,
                hint: 'Dia',
                text: date?.day.toString().padLeft(2, '0'),
                validator: DayValidator(),
                maskFormatter: MyMasks.dayMaskFormatter,
                onChanged: (text){
                  date?.day = int.parse(text ?? '0');
                  update(date);
                },
              ),
            ),
            const SizedBox(width: 15,),
            Flexible(
              child: TextFieldWidget(
                isVerticalDense: true,
                hint: 'Mês',
                text: date?.month.toString().padLeft(2, '0'),
                validator: MonthValidator(),
                maskFormatter: MyMasks.monthMaskFormatter,
                onChanged: (text){
                  date?.month = int.parse(text ?? '0');
                  update(date);
                },
              ),
            ),
            const SizedBox(width: 15,),
            Flexible(
              child: TextFieldWidget(
                isVerticalDense: true,
                hint: 'Ano',
                text: date?.year.abs().toString().padLeft(4, '0'),
                validator: YearValidator(),
                maskFormatter: MyMasks.yearMaskFormatter,
                onChanged: (text){
                  date?.year = int.parse(text ?? '0');
                  update(date);
                },
              ),
            ),
          ],
        ),
        if(date?.year != 0)
          CheckboxWidget(
              text: 'Antes de Cristo',
              checked: (date?.year ?? 0) < 0,
              onChanged: (checked){
                var year = date?.year ?? 0;
                if(checked ?? false){
                  if(year > 0){
                    date?.year = year * -1;
                  }
                }else {
                  if (year < 0) {
                    date?.year = year * -1;
                  }
                }
                update(date);
              }
          )
      ],
    );
  }
}