import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_list_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/default_alert_dialog_widget.dart';
import 'package:sanctorum_flutter/app/shared/utilities/my_colors.dart';

class EditListDialogWidget<T> extends StatefulWidget {
  const EditListDialogWidget({
    super.key,
    this.title,
    required this.onPressSave,
    this.fieldMaxLines,
    this.initialList,
    required this.buildItem,
    required this.insertItem,
  });

  final List<T>? initialList;
  final String? title;
  final FutureOr<bool> Function() onPressSave;
  final Widget Function(int, T, void Function(int, T)) buildItem;
  final T? Function(List<T>?) insertItem;
  final int? fieldMaxLines;

  @override
  State<EditListDialogWidget<T>> createState() => _EditListDialogWidgetState<T>();
}

class _EditListDialogWidgetState<T> extends State<EditListDialogWidget<T>> {
  EditListStore store = Modular.get();

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
              var list = triple.state as List;
              String error = triple.error ?? '';
              return SizedBox(
                height: 350,
                width: MediaQuery.of(context).size.width*0.3,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                    if(list.isNotEmpty && index <= list.indexOf(list.last)){
                      return Row(
                        children: [
                          Flexible(child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: MyColors.primaryColor
                                  )
                              ),
                              padding: const EdgeInsets.all(10),
                              child: widget.buildItem(index, list[index], store.updateItem)
                            )
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
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: (){
                              store.insertItem(widget.insertItem(list.map((e) => e as T).toList()));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, color: Colors.grey,)
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