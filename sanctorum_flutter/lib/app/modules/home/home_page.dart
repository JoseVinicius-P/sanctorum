import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/home_store.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeStore store = Modular.get();

  @override
  void initState() {
    store.fetchAllSaints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Sanctorum"),
        actions: [
          IconButton(
            onPressed: (){
              Modular.to.pushNamed('/control_panel');
            },
            icon: const Icon(Icons.precision_manufacturing),
          )
        ],
      ),
      body: TripleBuilder(
        store: store,
        builder: (context, triple) {
          var saints = triple.state as List<Saint>;

          return DynMouseScroll(
            durationMS: 1000,
            scrollSpeed: 1,
            animationCurve: Curves.easeOutQuart,
            builder: (context, controller, physics) {
              return GridView.builder(
                controller: controller,
                physics: physics,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Número de colunas na grade
                  crossAxisSpacing: 10.0, // Espaçamento entre as colunas
                  mainAxisSpacing: 10.0, // Espaçamento entre as linhas
                  childAspectRatio: 5/2, // Proporção entre largura e altura dos itens
                ),
                itemCount: saints.length,
                itemBuilder: (context, index) {
                  var saint = saints[index];
                  return Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.grey, width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      imageUrl: "http://localhost:8080${saint.urlImage}",
                                      placeholder: (context, url){
                                        return const Center(child: CircularProgressIndicator());
                                      },
                                      errorWidget: (context, url, error) => const Center(child: Icon(Icons.image_not_supported_outlined, color: Colors.grey,)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nome: ${saint.name ?? 'Desconhecido'}", maxLines: 1, overflow: TextOverflow.ellipsis,),
                                Text("Nome religioso: ${saint.religiousName ?? 'Desconhecido'}", maxLines: 1, overflow: TextOverflow.ellipsis,),
                                const SizedBox(height: 5,),
                                Flexible(
                                  child: Text(
                                    saint.summary ?? '...',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11
                                    ),
                                  )
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  );
                },
                padding: const EdgeInsets.all(10.0), // Espaçamento ao redor da grade
              );
            }
          );
        }
      ),
    );
  }
}