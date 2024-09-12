import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_date_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/data_field_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/default_alert_dialog_widget.dart';

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