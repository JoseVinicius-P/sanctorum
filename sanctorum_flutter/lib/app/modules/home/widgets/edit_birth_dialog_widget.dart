import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_birth_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/deatails_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/default_alert_dialog_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/period_widget.dart';
import 'package:sanctorum_flutter/app/shared/extensions/details.dart';

class EditBirthDialogWidget extends StatefulWidget {
  const EditBirthDialogWidget({super.key, this.oldBirth, this.title, required this.onPressSave});

  final Birth? oldBirth;
  final String? title;
  final FutureOr<bool> Function() onPressSave;

  @override
  State<EditBirthDialogWidget> createState() => _EditBirthDialogWidgetState();
}

class _EditBirthDialogWidgetState extends State<EditBirthDialogWidget> {
  EditBirthStore store = Modular.get();

  @override
  void initState() {
    store.updateBirth(widget.oldBirth);
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
                    var newBirth = triple.state as Birth?;
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
                                    isPeriod: (newBirth?.period?.length ?? 0) > 1,
                                    initialPeriod: newBirth?.period,
                                    updatePeriod: (period){
                                      store.updatePeriod(period);
                                    }
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                                child: DetailsWidget(initialDetails: newBirth?.getDetails, update: (details){
                                  newBirth?.setDetails(details);
                                  store.update(newBirth);
                                }),
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
      title: 'Editar nascimento                                         ',
      content: content,
      onPressedSave: widget.onPressSave,
    );
  }
}
