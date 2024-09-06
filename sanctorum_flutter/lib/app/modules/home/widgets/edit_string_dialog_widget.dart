import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_string_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/default_alert_dialog_widget.dart';
import 'package:sanctorum_flutter/app/shared/utilities/validator.dart';
import 'package:sanctorum_flutter/app/shared/widgets/text_field_widget.dart';

class EditStringDialogWidget extends StatefulWidget {
  const EditStringDialogWidget({super.key, this.oldString, this.title, required this.onPressSave, this.fieldMaxLines});

  final String? oldString;
  final String? title;
  final FutureOr<bool> Function() onPressSave;
  final int? fieldMaxLines;

  @override
  State<EditStringDialogWidget> createState() => _EditStringDialogWidgetState();
}

class _EditStringDialogWidgetState extends State<EditStringDialogWidget> {
  EditStringStore store = Modular.get();

  @override
  void initState() {
    store.updateString(widget.oldString);
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
              var newName = triple.state as String?;
              String error = triple.error ?? '';
              return Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.4
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        maxLines: widget.fieldMaxLines,
                        hint: 'Nome',
                        text: newName,
                        validator: StringValidator(),
                        onChanged: (text){
                          store.updateString(text);
                        },
                        error: error.isNotEmpty ? StringValidator().validate(newName) : null,
                      ),
                    ),
                  ],
                ),
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