import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_name_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/default_alert_dialog_widget.dart';
import 'package:sanctorum_flutter/app/shared/utilities/validator.dart';
import 'package:sanctorum_flutter/app/shared/widgets/text_field_widget.dart';

class EditNameDialogWidget extends StatefulWidget {
  const EditNameDialogWidget({super.key, this.oldName, this.title, required this.onPressSave});

  final String? oldName;
  final String? title;
  final FutureOr<bool> Function() onPressSave;

  @override
  State<EditNameDialogWidget> createState() => _EditNameDialogWidgetState();
}

class _EditNameDialogWidgetState extends State<EditNameDialogWidget> {
  EditNameStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    var content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TripleBuilder(
            store: store,
            builder: (context, triple) {
              var newName = triple.state as String?;
              String error = triple.error ?? '';
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      text: widget.oldName ?? 'Nome',
                      validator: StringValidator(),
                      onChanged: (text){
                        store.updateName(text);
                      },
                      error: error.isNotEmpty ? StringValidator().validate(newName) : null,
                    ),
                  ),
                ],
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