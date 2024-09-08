import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_date_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/checkbox_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/default_alert_dialog_widget.dart';
import 'package:sanctorum_flutter/app/shared/utilities/my_masks.dart';
import 'package:sanctorum_flutter/app/shared/utilities/validator.dart';
import 'package:sanctorum_flutter/app/shared/widgets/text_field_widget.dart';

class EditDateDialogWidget extends StatefulWidget {
  const EditDateDialogWidget({super.key, this.oldDate, this.title, required this.onPressSave});

  final Date? oldDate;
  final String? title;
  final FutureOr<bool> Function() onPressSave;

  @override
  State<EditDateDialogWidget> createState() => _EditDateDialogWidgetState();
}

class _EditDateDialogWidgetState extends State<EditDateDialogWidget> {
  EditDateStore store = Modular.get();

  @override
  void initState() {
    store.updateDate(widget.oldDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TripleBuilder(
            store: store,
            builder: (context, triple) {
              var newDate = triple.state as Date?;
              String error = triple.error ?? '';
              return Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.4
                ),
                child: DataFieldWidget(date: newDate, update: store.updateDate),
              );
            }
        ),
      ],
    );
    return DefaultAlertDialogWidget(
      title: widget.title,
      content: content,
      onPressedSave: widget.onPressSave,
    );
  }
}

class DataFieldWidget extends StatelessWidget {
  const DataFieldWidget({
    super.key,
    required this.date,
    required this.update,
  });

  final Date? date;
  final void Function(Date?) update;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: TextFieldWidget(
                hint: 'Dia',
                text: date?.day.toString().padLeft(2, '0'),
                validator: DayValidator(),
                maskFormatter: MyMasks.dayMaskFormatter,
                onChanged: (text){
                  date?.day = int.parse(text);
                  update(date);
                },
              ),
            ),
            const SizedBox(width: 15,),
            Flexible(
              child: TextFieldWidget(
                hint: 'Mês',
                text: date?.month.toString().padLeft(2, '0'),
                validator: MonthValidator(),
                maskFormatter: MyMasks.monthMaskFormatter,
                onChanged: (text){
                  date?.month = int.parse(text);
                  update(date);
                },
              ),
            ),
            const SizedBox(width: 15,),
            Flexible(
              child: TextFieldWidget(
                hint: 'Ano',
                text: date?.year.abs().toString().padLeft(4, '0'),
                validator: YearValidator(),
                maskFormatter: MyMasks.yearMaskFormatter,
                onChanged: (text){
                  date?.year = int.parse(text);
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