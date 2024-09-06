import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_list_string_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/default_alert_dialog_widget.dart';
import 'package:sanctorum_flutter/app/shared/utilities/validator.dart';
import 'package:sanctorum_flutter/app/shared/widgets/text_field_widget.dart';

class EditListStringDialogWidget extends StatefulWidget {
  const EditListStringDialogWidget({super.key, this.title, required this.onPressSave, this.fieldMaxLines, this.initialList, required this.textFieldsHint});

  final List<String>? initialList;
  final String? title;
  final String textFieldsHint;
  final FutureOr<bool> Function() onPressSave;
  final int? fieldMaxLines;

  @override
  State<EditListStringDialogWidget> createState() => _EditListStringDialogWidgetState();
}

class _EditListStringDialogWidgetState extends State<EditListStringDialogWidget> {
  EditListStringStore store = Modular.get();

  @override
  void initState() {
    store.updateList(widget.initialList ?? []);
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
              var list = triple.state as List<String>;
              String error = triple.error ?? '';
              return SizedBox(
                height: 350,
                width: MediaQuery.of(context).size.width*0.3,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                    if(index <= list.indexOf(list.last)){
                      return Row(
                        children: [
                          Flexible(
                            child: TextFieldWidget(
                              isVerticalDense: true,
                              maxLines: widget.fieldMaxLines,
                              hint: "${widget.textFieldsHint} ${index+1}",
                              text: list[index],
                              validator: StringValidator(),
                              onChanged: (text){
                                store.updateItem(index, text);
                              },
                              error: error.isNotEmpty ? StringValidator().validate(list[index]) : null,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          IconButton(
                              onPressed: (){
                                store.removeItem(index);
                              },
                              icon: const Icon(Icons.delete, color: Colors.grey,)
                          )
                        ],
                      );
                    }else{
                      return Opacity(
                        opacity: 0.5,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.text,
                          child: GestureDetector(
                            onTap: (){
                              if(list.every((e)=>e.trim().isNotEmpty)){
                                store.insertItem('');
                              }
                            },
                            child: Row(
                              children: [
                                Flexible(
                                  child: TextFieldWidget(
                                    enable: false,
                                    isVerticalDense: true,
                                    maxLines: widget.fieldMaxLines,
                                    hint: 'Adicionar novo(a)',
                                    validator: StringValidator(),
                                    onChanged: (text){},
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                IconButton(
                                  onPressed: (){
                                    if(list.every((e)=>e.trim().isNotEmpty)) {
                                      store.insertItem('');
                                    }
                                  },
                                  icon: const Icon(Icons.add, color: Colors.grey,)
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                  },
                  separatorBuilder: (context, index){
                    return const SizedBox(height: 30,);
                  },
                  itemCount: list.length + 1,
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