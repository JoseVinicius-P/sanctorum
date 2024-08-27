import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/home_store.dart';
import 'package:sanctorum_flutter/main.dart';
import 'package:universal_html/html.dart' as html;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
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
      appBar: AppBar(
        title: const Text("Sanctorum"),
      ),
      body: TripleBuilder(
        store: store,
        builder: (context, triple) {
          var saints = triple.state as List<Saint>;

          return GridView.builder(
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
                      if(saint.urlImage != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: "http://localhost:8080${saint.urlImage}",
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nome: ${saint.name ?? 'Desconhecido'}", maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Text("Nome religioso: ${saint.religiousName ?? 'Desconhecido'}", maxLines: 1, overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 5,),
                            Flexible(
                              child: Text(
                                "Nome religioso: ${saint.summary ?? '...'}",
                                style: TextStyle(
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
            padding: EdgeInsets.all(10.0), // Espaçamento ao redor da grade
          );
        }
      ),
    );
  }
}