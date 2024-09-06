import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/details_store.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_sex_store.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/edit_list_string_dialog_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/edit_string_dialog_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/edit_sex_dialog_widget.dart';
import 'package:sanctorum_flutter/app/shared/extensions/parse_display_string.dart';
import 'package:sanctorum_flutter/app/shared/my_text_styles.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.saintId});
  final int saintId;
  @override
  DetailsPageState createState() => DetailsPageState();
}
class DetailsPageState extends State<DetailsPage> {

  DetailsStore detailsStore = Modular.get();

  @override
  void initState() {
    detailsStore.getSaintById(widget.saintId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: TripleBuilder(
        store: detailsStore,
        builder: (context, triple) {
          var saint = triple.state as Saint?;
          if(saint != null){
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Material(
                            elevation: 20,
                            borderRadius: BorderRadius.circular(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: "http://localhost:8080${saint.urlImage}",
                                errorWidget: (context, url, error) => const Center(child: Icon(Icons.image_not_supported_outlined, color: Colors.grey,)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: DynMouseScroll(
                    durationMS: 1000,
                    scrollSpeed: 1,
                    animationCurve: Curves.easeOutQuart,
                    builder: (context, controller, physics) {
                      return SingleChildScrollView(
                        physics: physics,
                        controller: controller,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              EditWidget(
                                contentDialog: EditStringDialogWidget(
                                  onPressSave: (){
                                    return true;
                                  },
                                  oldString: saint.religiousName ?? saint.name,
                                  title: saint.religiousName != null ? 'Editar nome religioso' : 'Editar nome de nascimento',
                                ),
                                child: Text(saint.religiousName ?? saint.name!, style: MyTextStyles.title4)
                              ),
                              EditWidget(
                                contentDialog: EditStringDialogWidget(
                                  onPressSave: (){
                                    return true;
                                  },
                                  oldString: saint.religiousName != null ? saint.name : null,
                                  title: saint.religiousName != null ? 'Editar nome de batismo' : 'Adicionar nome religioso',
                                ),
                                child: Text(saint.religiousName != null ? 'Nome de batismo: ${saint.name}' : 'Nome religioso desconhecido',
                                  style: MyTextStyles.defaultText.copyWith(color: Colors.grey
                                  ),
                                )
                              ),
                              const SizedBox(height: 15,),

                              EditWidget(
                                contentDialog: EditStringDialogWidget(
                                  onPressSave: (){
                                    return true;
                                  },
                                  oldString: saint.title,
                                  title: saint.title != null ? 'Editar título' : 'Adicionar título',
                                ),
                                child: DoubleTextWidget(title: "Título: ", text: saint.title,)
                              ),

                              EditWidget(
                                  contentDialog: EditStringDialogWidget(
                                    onPressSave: (){
                                      return true;
                                    },
                                    fieldMaxLines: 5,
                                    oldString: saint.summary,
                                    title: saint.summary != null ? 'Editar resumo' : 'Adicionar resumo',
                                  ),
                                child: DoubleTextWidget(title: "Resumo: ", text: saint.summary, isHorizontal: false, verticalBetweenDistance: 5,)
                              ),

                              EditWidget(
                                contentDialog: EditSexDialogWidget(
                                  oldSex: Sex.values.singleWhere((e) => e.name == saint.gender, orElse: () => Sex.M),
                                  onPressSave: (){
                                    return true;
                                  }
                                ),
                                child: DoubleTextWidget(title: 'Sexo: ', text: saint.gender == 'M' ? 'Masculino' : 'Feminino')
                              ),

                              EditWidget(
                                contentDialog: EditListStringDialogWidget(
                                  title: 'Editar formação acadêmica',
                                  initialList: saint.academicTraining,
                                  onPressSave: (){
                                    return true;
                                  },
                                  textFieldsHint: 'Formação acadêmica'
                                ),
                                child: DoubleTextWidget(title: 'Fomação acadêmica: ', text: saint.academicTrainingToDisplayString,)
                              ),

                              EditWidget(child: DoubleTextWidget(title: "Data da beatificação: ", text: saint.beatificationDateToDisplayString,)),

                              EditWidget(child: DoubleTextWidget(title: "Data da canônização: ", text: saint.canonizationDateToDisplayString,)),

                              EditWidget(
                                child: DisplayListWidget<EcclesiasticalHierarchy>(
                                  title: 'Designações: ',
                                  list: saint.ecclesiasticalHierarchy,
                                  generateItem: (item){
                                    return DoubleTextWidget(
                                      title: "${item.hiearchyName ?? ''}: ",
                                      isTitleBold: false,
                                      text: item.details,
                                      nullTextMessage: 'Detalhes não informados',
                                      distanceBelow: 5,
                                    );
                                  },
                                ),
                              ),

                              EditWidget(
                                child: DisplayListWidget<Miracle>(
                                  title: 'Milagres: ',
                                  list: saint.miracles,
                                  generateItem: (item){
                                    return DoubleTextWidget(
                                      title: "${item.name!}: ",
                                      isTitleBold: false,
                                      text: item.details,
                                      nullTextMessage: 'Detalhes do milagre não informados',
                                      distanceBelow: 5,
                                    );
                                  },
                                ),
                              ),

                              EditWidget(
                                contentDialog: EditListStringDialogWidget(
                                  title: 'Editar orações',
                                  initialList: saint.prayers,
                                  onPressSave: (){
                                    return true;
                                  },
                                  textFieldsHint: 'Oração'
                                ),
                                child: DisplayListWidget<String>(
                                  title: 'Orações: ',
                                  list: saint.prayers,
                                  generateItem: (item){
                                    return Text('"$item"', style: MyTextStyles.defaultText);
                                  },
                                ),
                              ),

                              EditWidget(
                                child: DisplayListWidget<Quotation>(
                                  title: 'Citações: ',
                                  list: saint.quotations,
                                  generateItem: (item){
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        DoubleTextWidget(title: '', isTitleBold: false, text: '"${item.quote}"', horizontalBetweenDistance: 0,),
                                        DoubleTextWidget(title: 'Referência: ', isTitleBold: false, text: item.reference, distanceBelow: 0),
                                        DoubleTextWidget(title: 'Contexto: ', isTitleBold: false, text: item.context, distanceBelow: 20,)
                                      ],
                                    );
                                  },
                                ),
                              ),

                              EditWidget(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DoubleTextWidget(title: "Nascimento", text: saint.birth != null ? '' : null, distanceBelow: 5,),
                                    if(saint.birth != null)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          DoubleTextWidget(
                                            title: 'Data: ',
                                            isTitleBold: false,
                                            text: saint.periodToDisplayString(saint.birth?.period),
                                            distanceBelow: 0,
                                          ),
                                          DoubleTextWidget(title: "País: ", isTitleBold: false, text: saint.birth?.country, distanceBelow: 0,),
                                          if(saint.birth?.country != saint.birth?.correspondentActualCountry || saint.birth?.country == null)
                                            DoubleTextWidget(title: "Nome do país atualmente: ", isTitleBold: false, text: saint.birth?.correspondentActualCountry, distanceBelow: 0,),
                                          DoubleTextWidget(title: "Cidade: ", isTitleBold: false, text: saint.birth?.city, distanceBelow: 0,),
                                          DoubleTextWidget(title: "Detalhes: ", isTitleBold: false, text: saint.birth?.details),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              EditWidget(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DoubleTextWidget(title: "Morte", text: saint.death != null ? '' : null, distanceBelow: 5,),
                                    if(saint.death != null)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          DoubleTextWidget(
                                            title: 'Data: ',
                                            isTitleBold: false,
                                            text: saint.periodToDisplayString(saint.death?.period),
                                            distanceBelow: 0,
                                          ),
                                          DoubleTextWidget(title: "País: ", isTitleBold: false, text: saint.death?.country, distanceBelow: 0,),
                                          if(saint.death?.country != saint.death?.correspondentActualCountry || saint.death?.country == null)
                                            DoubleTextWidget(title: "Nome do país atualmente: ", isTitleBold: false, text: saint.death?.correspondentActualCountry, distanceBelow: 0,),
                                          DoubleTextWidget(title: "Cidade: ", isTitleBold: false, text: saint.death?.city, distanceBelow: 0,),
                                          DoubleTextWidget(title: "Causa da morte: ", isTitleBold: false, text: saint.death?.causeOfdeath, distanceBelow: 0,),
                                          DoubleTextWidget(title: "Mártir? ", isTitleBold: false, text: saint.death?.isMartir == null ? null : saint.death!.isMartir! ? 'Sim' : "Não",),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              EditWidget(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DoubleTextWidget(title: "Família", text: saint.birth != null ? '' : null, distanceBelow: 5,),
                                    if(saint.family != null)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            DoubleTextWidget(title: "Pai: ", isTitleBold: false, text: saint.family?.father, distanceBelow: 0,),
                                            DoubleTextWidget(title: "Mãe: ", isTitleBold: false, text: saint.family?.mother, distanceBelow: 0,),
                                            DoubleTextWidget(title: "Irmãos: ", isTitleBold: false, text: (saint.family?.numberOfSiblings ?? 0).toString()),
                                          ],
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ],
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }
}

class EditWidget extends StatefulWidget {
  const EditWidget({
    super.key,
    required this.child, this.contentDialog,
  });

  final Widget child;
  final Widget? contentDialog;

  @override
  State<EditWidget> createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  bool isInside = false;

  void showDialogWidget(){
    showDialog(context: context, builder: (context){
      return widget.contentDialog!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) => setState(() {
        isInside = true;
      }),
      onExit: (e) => setState(() {
        isInside = false;
      }),
      child: GestureDetector(
        onTap: (){
          if(widget.contentDialog != null){
            showDialogWidget();
          }
        },
        child: Stack(
          children: [
            widget.child,
            if(isInside)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Icon(Icons.edit, size: 13,)
                )
              )
          ],
        ),
      ),
    );
  }
}

class DisplayListWidget<T> extends StatelessWidget {
  const DisplayListWidget({
    super.key, this.title, this.list,
    double? distanceBelow, required this.generateItem,
  }) :  distanceBelow = distanceBelow ?? 15;

  final String? title;
  final List<T>? list;
  final Widget Function(T) generateItem;
  final double distanceBelow;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title != null)
          DoubleTextWidget(title: title!, text: list != null && list!.isNotEmpty ? '' : null, distanceBelow: 5,),
        if(list != null && list!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Builder(
                builder: (context){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: list!.map((e){
                      return generateItem(e);
                    }).toList(),
                  );
                }
            ),
          ),
        const SizedBox(height: 15,),
      ],
    );
  }
}

class DoubleTextWidget extends StatelessWidget {
  const DoubleTextWidget({
    super.key,
    this.text, required this.title,
    bool? isHorizontal,
    double? horizontalBetweenDistance,
    double? verticalBetweenDistance,
    double? distanceBelow,
    bool? isTitleBold,
    String? nullTextMessage
  }) : isHorizontal = isHorizontal ?? true,
        horizontalBetweenDistance = horizontalBetweenDistance ?? 5,
        verticalBetweenDistance = verticalBetweenDistance ?? 10,
        distanceBelow = distanceBelow ?? 15,
        isTitleBold = isTitleBold ?? true,
        nullTextMessage = nullTextMessage ?? 'Não informado';

  final String? text;
  final String nullTextMessage;
  final bool isTitleBold;
  final String title;
  final bool isHorizontal;
  final double? horizontalBetweenDistance;
  final double? verticalBetweenDistance;
  final double distanceBelow;

  @override
  Widget build(BuildContext context) {
    if(isHorizontal){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: MyTextStyles.defaultText.copyWith(fontWeight: isTitleBold ? FontWeight.bold : FontWeight.normal),
              ),
              TextSpan(
                text: text ?? 'Não informado',
                style: MyTextStyles.defaultText.copyWith(color: text != null ? Colors.black : Colors.grey, fontStyle: text != null ? FontStyle.normal : FontStyle.italic),
              ),
            ]
          )),
          SizedBox(height: distanceBelow,),
        ],
      );
    }else{
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title ', style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: verticalBetweenDistance,),
          Text(
            text ?? nullTextMessage,
            style: MyTextStyles.defaultText.copyWith(color: text != null ? Colors.black : Colors.grey),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: distanceBelow,),
        ],
      );
    }
  }
}