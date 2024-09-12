import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_sex_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/default_alert_dialog_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/two_radiobutton_widget.dart';

class EditSexDialogWidget extends StatefulWidget {
  const EditSexDialogWidget({super.key, required this.onPressSave, this.oldSex});

  final Sex? oldSex;
  final FutureOr<bool> Function() onPressSave;

  @override
  State<EditSexDialogWidget> createState() => _EditSexDialogWidgetState();
}

class _EditSexDialogWidgetState extends State<EditSexDialogWidget> {
  EditSexStore store = Modular.get();

  @override
  void initState() {
    store.updateSex(widget.oldSex);
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
              var sex = triple.state as Sex?;
              String error = triple.error ?? '';
              return Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.4
                ),
                child: TwoRadioButtonWidget<Sex?>(
                    initialValue: widget.oldSex,
                    text1: 'Maxculino',
                    text2: 'Feminino',
                    value1: Sex.M,
                    value2: Sex.F,
                    onChanged: (sex){
                      store.updateSex(sex);
                    }
                ),
              );
            }
        ),
      ],
    );
    return DefaultAlertDialogWidget(
      title: 'Editar sexo',
      content: content,
      onPressedSave: widget.onPressSave,
    );
  }
}