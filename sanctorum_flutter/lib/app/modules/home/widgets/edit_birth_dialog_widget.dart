import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_birth_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/data_field_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/default_alert_dialog_widget.dart';
import 'package:sanctorum_flutter/app/shared/extensions/details.dart';
import 'package:sanctorum_flutter/app/shared/utilities/validator.dart';
import 'package:sanctorum_flutter/app/shared/widgets/text_field_widget.dart';

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
  bool isPeriod = false;

  @override
  void initState() {
    isPeriod = (widget.oldBirth?.period?.length ?? 0) > 1;
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
                                child: LocationWidget(initialDetails: newBirth?.getDetails, update: (details){
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

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.initialDetails, required this.update,
  });

  final Details? initialDetails;
  final void Function(Details?) update;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 15,),
        Flexible(
          child: TextFieldWidget(
            maxLines: 1,
            hint: "País",
            text: initialDetails?.country,
            validator: StringValidator(),
            onChanged: (text){
              initialDetails?.country = text;
              update(initialDetails);
            },
          ),
        ),
        Flexible(
          child: TextFieldWidget(
            maxLines: 1,
            hint: "País que corresponde atualmente",
            text: initialDetails?.correspondentActualCountry,
            validator: StringValidator(),
            onChanged: (text){
              initialDetails?.correspondentActualCountry = text;
              update(initialDetails);
            },
          ),
        ),
        Flexible(
          child: TextFieldWidget(
            maxLines: 1,
            hint: "Cidade",
            text: initialDetails?.city,
            validator: StringValidator(),
            onChanged: (text){
              initialDetails?.city = text;
              update(initialDetails);
            },
          ),
        ),
        Flexible(
          child: TextFieldWidget(
            maxLines: 1,
            hint: "Detalhes",
            text: initialDetails?.details,
            validator: StringValidator(),
            onChanged: (text){
              initialDetails?.details = text;
              update(initialDetails);
            },
          ),
        ),
      ],
    );
  }
}

class PeriodWidget extends StatefulWidget {
  const PeriodWidget({super.key, required this.isPeriod, required this.initialPeriod, required this.updatePeriod});

  final bool isPeriod;
  final List<Date>? initialPeriod;
  final void Function(List<Date>?) updatePeriod;

  @override
  State<PeriodWidget> createState() => _PeriodWidgetState();
}

class _PeriodWidgetState extends State<PeriodWidget> {
  late bool isPeriod;
  late List<Date>? period;

  @override
  void initState() {
    isPeriod = widget.isPeriod;
    period = widget.initialPeriod;
    super.initState();
  }

  void updatePeriod(List<Date>? newPeriod) async {
    period = newPeriod;
  }

  void updateFirstDate(Date? newDate) async {
    if(newDate != null){
      if(period != null){
        period!.first = newDate;
      }else{
        period = [newDate];
      }
    }
  }

  void updateLastDate(Date? newDate) async {
    if(newDate != null){
      if(period != null){
        period!.add(newDate);
      }
    }else {
      if ((period?.length ?? 0) > 1) {
        period?.removeLast();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: RadioListTile<bool>(
                selected: isPeriod,
                visualDensity: VisualDensity.compact,
                title: const Text('Data exata'),
                dense: true,
                contentPadding: const EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                mouseCursor: SystemMouseCursors.click,
                value: false,
                groupValue: isPeriod,
                onChanged: (bool? value) {
                  if(value == false){
                    setState(() {
                      isPeriod = value ?? false;
                    });
                    widget.updatePeriod(null);
                  }
                },
              ),
            ),
            Expanded(
              child: RadioListTile<bool>(
                selected: !isPeriod,
                visualDensity: VisualDensity.compact,
                dense: true,
                contentPadding: const EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                mouseCursor: SystemMouseCursors.click,
                title: const Text('Período'),
                value: true,
                groupValue: isPeriod,
                onChanged: (bool? value) {
                  if(value == true){
                    setState(() {
                      isPeriod = value ?? false;

                    });
                    updateLastDate(period?.first);
                    widget.updatePeriod(period);
                  }

                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 5,),
        DataFieldWidget(title: isPeriod ? 'Data inicial' : 'Data', date: period?.first, update: (date){
          updateFirstDate(date);
          widget.updatePeriod(period);
        }),
        const SizedBox(height: 5,),
        if(isPeriod && period != null && period!.isNotEmpty)
          DataFieldWidget(title: 'Data final', date: period?.last, update: (date){
            updateLastDate(date);
            widget.updatePeriod(period);
          }),
      ],
    );
  }
}
