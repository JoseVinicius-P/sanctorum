import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/details_store.dart';
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

  String dateToString(Date date){
    String dateString = '';
    if(date.day != 0){
      dateString += date.day.toString().padLeft(2, '0');
    }

    if(date.month != 0){
      dateString += "/${date.month.toString().padLeft(2, '0')}";
    }

    if(date.year != 0){
      dateString += "/${date.year.toString().padLeft(2, '0')}";
    }

    return dateString;
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
                              Text(saint.religiousName != null ? '${saint.religiousName}' : '${saint.name}', style: MyTextStyles.title4),
                              Text(saint.religiousName != null ? 'Nome de batismo: ${saint.name}' : 'Nome religioso desconhecido', style: MyTextStyles.defaultText.copyWith(color: Colors.grey),),
                              const SizedBox(height: 15,),

                              if(saint.title != null)
                              Text('Título: ${saint.title}', style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
                              Text('${saint.summary}', style: MyTextStyles.defaultText,),
                              const SizedBox(height: 10,),
                              if(saint.gender != null)
                                Text("Sexo: ${saint.gender == 'M' ? 'Masculino' : 'Feminino'}", style: MyTextStyles.defaultText,),
                              if(saint.gender != null)
                                const SizedBox(height: 15,),


                              if(saint.academicTraining != null && saint.academicTraining!.isNotEmpty)
                              Text('Fomação acadêmica:', style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
                              if(saint.academicTraining != null && saint.academicTraining!.isNotEmpty)
                              Builder(
                                builder: (context){
                                  String formation = '';
                                  for(var form in saint.academicTraining!){
                                    formation += "$form,";
                                  }
                                  if(formation.isNotEmpty){
                                    return Text(formation, style: MyTextStyles.defaultText,);
                                  }else{
                                    return const SizedBox.shrink();
                                  }

                                }
                              ),
                              if(saint.academicTraining != null && saint.academicTraining!.isNotEmpty)
                              const SizedBox(height: 15,),

                              if(saint.beatificationDate != null)
                                Text('Data da Beatificação', style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
                              if(saint.beatificationDate != null)
                                Text(dateToString(saint.beatificationDate!), style: MyTextStyles.defaultText,),
                              if(saint.cononizationDate != null)
                                Text('Data da canônização', style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
                              if(saint.cononizationDate != null)
                                Text(dateToString(saint.cononizationDate!), style: MyTextStyles.defaultText,),
                              if(saint.cononizationDate != null || saint.beatificationDate != null)
                                const SizedBox(height: 15,),

                              if(saint.ecclesiasticalHierarchy != null && saint.ecclesiasticalHierarchy!.isNotEmpty)
                                const Text('Hierarquia eclesial:', style: MyTextStyles.defaultText,),
                              if(saint.ecclesiasticalHierarchy != null && saint.ecclesiasticalHierarchy!.isNotEmpty)
                                Builder(
                                  builder: (context){
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: saint.ecclesiasticalHierarchy!.map((e){
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            if(e.hiearchyName != null)
                                              Text("  - ${e.hiearchyName!}", style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
                                            if(e.details != null)
                                              Text("      ${e.details!}", style: MyTextStyles.defaultText,),

                                          ],
                                        );
                                      }).toList(),
                                    );
                                  }
                                ),
                              if(saint.ecclesiasticalHierarchy != null && saint.ecclesiasticalHierarchy!.isNotEmpty)
                                const SizedBox(height: 15,),

                              if(saint.miracles != null && saint.miracles!.isNotEmpty)
                                const Text('Milagres:', style: MyTextStyles.defaultText,),
                              if(saint.miracles != null && saint.miracles!.isNotEmpty)
                                Builder(
                                    builder: (context){
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: saint.miracles!.map((e){
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("  - ${e.name!}", style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
                                              Text("      ${e.details!}", style: MyTextStyles.defaultText,)
                                            ],
                                          );
                                        }).toList(),
                                      );
                                    }
                                ),
                              if(saint.miracles != null && saint.miracles!.isNotEmpty)
                              const SizedBox(height: 15,),

                              if(saint.prayers != null && saint.prayers!.isNotEmpty)
                              Text("Orações:", style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
                              if(saint.prayers != null && saint.prayers!.isNotEmpty)
                              Builder(
                                builder: (context){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: saint.prayers!.map((e){
                                      return Text('  - "$e"', style: MyTextStyles.defaultText);
                                    }).toList(),
                                  );
                                }
                              ),
                              if(saint.prayers != null && saint.prayers!.isNotEmpty)
                              const SizedBox(height: 15,),


                              if(saint.quotations != null && saint.quotations!.isNotEmpty)
                                Text("Citações:", style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
                              if(saint.quotations != null && saint.quotations!.isNotEmpty)
                                Builder(
                                    builder: (context){
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: saint.quotations!.map((e){
                                          return Text('  - "${e.quote}"', style: MyTextStyles.defaultText);
                                        }).toList(),
                                      );
                                    }
                                ),
                              if(saint.quotations != null && saint.quotations!.isNotEmpty)
                              const SizedBox(height: 15,),

                              if(saint.birth != null)
                                Text("Nascimento:", style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
                              if(saint.birth?.period != null && saint.birth!.period!.isNotEmpty)
                                Text(saint.birth!.period!.length == 1 ? "Data: ${dateToString(saint.birth!.period!.first)}" : "Data: ${dateToString(saint.birth!.period!.first)} a ${dateToString(saint.birth!.period!.last)}", style: MyTextStyles.defaultText),
                              if(saint.birth?.country != null)
                                Text("País: ${saint.birth!.country}", style: MyTextStyles.defaultText,),
                              if(saint.birth?.city != null)
                                Text("Cidade: ${saint.birth!.city}", style: MyTextStyles.defaultText,),
                              if(saint.birth?.details != null)
                                Text("Detalhes: ${saint.birth!.details}", style: MyTextStyles.defaultText,),
                              if(saint.birth != null)
                                const SizedBox(height: 15,),

                              if(saint.death != null)
                                Text("Morte:", style: MyTextStyles.defaultText.copyWith(fontWeight: FontWeight.bold),),
                              if(saint.death?.period != null && saint.birth!.period!.isNotEmpty)
                                Text(saint.death!.period!.length == 1 ? "Data: ${dateToString(saint.death!.period!.first)}" : "Data: ${dateToString(saint.death!.period!.first)} a ${dateToString(saint.death!.period!.last)}", style: MyTextStyles.defaultText),
                              if(saint.death?.country != null)
                                Text("País: ${saint.death!.country}", style: MyTextStyles.defaultText,),
                              if(saint.death?.city != null)
                                Text("Cidade: ${saint.death!.city}", style: MyTextStyles.defaultText,),
                              if(saint.death?.details != null)
                                Text("Detalhes: ${saint.death!.details}", style: MyTextStyles.defaultText,),
                              if(saint.death?.causeOfdeath != null)
                                Text("Causa da morte: ${saint.death!.causeOfdeath}", style: MyTextStyles.defaultText,),
                              if(saint.death != null)
                                const SizedBox(height: 15,),
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