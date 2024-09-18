import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_family_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/default_alert_dialog_widget.dart';
import 'package:sanctorum_flutter/app/shared/utilities/validator.dart';
import 'package:sanctorum_flutter/app/shared/widgets/text_field_widget.dart';

class EditFamilyDialogWidget extends StatefulWidget {
  const EditFamilyDialogWidget({super.key, this.oldFamily, this.title, required this.onPressSave});

  final Family? oldFamily;
  final String? title;
  final FutureOr<bool> Function() onPressSave;

  @override
  State<EditFamilyDialogWidget> createState() => _EditFamilyDialogWidgetState();
}

class _EditFamilyDialogWidgetState extends State<EditFamilyDialogWidget> {
  EditFamilyStore store = Modular.get();

  @override
  void initState() {
    store.updateFamily(widget.oldFamily);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var content = TripleBuilder(
        store: store,
        builder: (context, triple) {
          var newFamily = triple.state as Family?;
          String error = triple.error ?? '';
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextFieldWidget(
                    maxLines: 1,
                    hint: "Nome da mãe",
                    text: newFamily?.mother,
                    validator: NameValidator(),
                    onChanged: (text){
                      newFamily?.mother = text;
                      store.updateFamily(newFamily);
                    },
                  ),
                ),
                Flexible(
                  child: TextFieldWidget(
                    maxLines: 1,
                    hint: "Nome do pai",
                    text: newFamily?.father,
                    validator: NameValidator(),
                    onChanged: (text){
                      newFamily?.father = text;
                      store.updateFamily(newFamily);
                    },
                  ),
                ),
                Flexible(
                  child: TextFieldWidget(
                    maxLines: 1,
                    hint: "Número de irmãos",
                    text: newFamily?.numberOfSiblings.toString(),
                    validator: StringValidator(),
                    onChanged: (text){
                      newFamily?.numberOfSiblings = int.parse(text ?? '0');
                      store.updateFamily(newFamily);
                    },
                  ),
                ),
              ],
            ),
          );
        }
    );
    return DefaultAlertDialogWidget(
      title: 'Editar Família',
      content: content,
      onPressedSave: widget.onPressSave,
    );
  }
}
