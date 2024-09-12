import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_death_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/deatails_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/default_alert_dialog_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/period_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/two_radiobutton_widget.dart';
import 'package:sanctorum_flutter/app/shared/extensions/details.dart';
import 'package:sanctorum_flutter/app/shared/utilities/validator.dart';
import 'package:sanctorum_flutter/app/shared/widgets/text_field_widget.dart';

class EditDeathDialogWidget extends StatefulWidget {
  const EditDeathDialogWidget({super.key, this.oldDeath, this.title, required this.onPressSave});

  final Death? oldDeath;
  final String? title;
  final FutureOr<bool> Function() onPressSave;

  @override
  State<EditDeathDialogWidget> createState() => _EditDeathDialogWidgetState();
}

class _EditDeathDialogWidgetState extends State<EditDeathDialogWidget> {
  EditDeathStore store = Modular.get();

  @override
  void initState() {
    store.updateDeath(widget.oldDeath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var content = Scaffold(
      backgroundColor: Colors.transparent,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.date_range_rounded), text: "Período"),
                  Tab(icon: Icon(Icons.read_more), text: "Detalhes",),
                ]
            ),
            Expanded(
              child: TripleBuilder(
                  store: store,
                  builder: (context, triple) {
                    var newDeath = triple.state as Death?;
                    String error = triple.error ?? '';
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TabBarView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  PeriodWidget(
                                    isPeriod: (newDeath?.period?.length ?? 0) > 1,
                                    initialPeriod: newDeath?.period,
                                    updatePeriod: (period){
                                      store.updatePeriod(period);
                                    }
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    DetailsWidget(initialDetails: newDeath?.getDetails, update: (details){
                                      newDeath?.setDetails(details);
                                      store.update(newDeath);
                                    }),
                                    Flexible(
                                      child: TextFieldWidget(
                                        maxLines: 1,
                                        hint: "Causa da morte",
                                        text: newDeath?.causeOfdeath,
                                        validator: StringValidator(),
                                        onChanged: (text){
                                          newDeath?.causeOfdeath = text;
                                          store.updateDeath(newDeath);
                                        },
                                      ),
                                    ),
                                    TwoRadioButtonWidget<bool>(
                                      title: 'Foi um mártir?',
                                      initialValue: newDeath?.isMartir ?? false,
                                      text1: "Sim",
                                      text2: 'Não',
                                      value1: true,
                                      value2: false,
                                      onChanged: (isMartir){
                                        newDeath?.isMartir = isMartir;
                                        store.updateDeath(newDeath);
                                      }
                                    )
                                  ],
                                ),
                              ),
                          ]),
                        ),
                      ],
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
    return DefaultAlertDialogWidget(
      title: 'Editar falecimento                                         ',
      content: content,
      onPressedSave: widget.onPressSave,
    );
  }
}
