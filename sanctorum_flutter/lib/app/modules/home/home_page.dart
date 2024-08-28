import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
  void Function(int) lastSearchFunction = (page){};

  @override
  void initState() {
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
      body: DynMouseScroll(
        durationMS: 1000,
        scrollSpeed: 1,
        animationCurve: Curves.easeOutQuart,
        builder: (context, controller, physics) {
          return CustomScrollView(
            physics: physics,
            controller: controller,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SearchBar(
                      hintText: 'Pesquisar Santo...',
                      onSubmitted: (query){
                          store.pagingController.removePageRequestListener(lastSearchFunction);
                          store.pagingController.removePageRequestListener(store.fetchAllSaints);
                          lastSearchFunction = (page) => store.searchSaint(query, page);
                          store.pagingController.addPageRequestListener(lastSearchFunction);
                          store.update([]);
                          store.pagingController.refresh();
                      },
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
              SaintGridView(pagingController: store.pagingController)
            ],
          );
        }
      ),
    );
  }
}

class SaintItem extends StatelessWidget {
  const SaintItem({
    super.key,
    required this.saint,
  });

  final Saint saint;

  @override
  Widget build(BuildContext context) {
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
  }
}

class SaintGridView extends StatefulWidget {
  const SaintGridView({super.key, required this.pagingController});

  final PagingController<int, Saint> pagingController;

  @override
  State<SaintGridView> createState() => _SaintGridViewState();
}

class _SaintGridViewState extends State<SaintGridView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
  PagedSliverGrid<int, Saint>(
      shrinkWrapFirstPageIndicators: true,
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      pagingController: widget.pagingController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Define o número de colunas no GridView
        crossAxisSpacing: 8, // Espaçamento entre as colunas
        mainAxisSpacing: 8, // Espaçamento entre as linhas
        childAspectRatio: 5/2, // Proporção da altura para largura dos itens
      ),
      builderDelegate: PagedChildBuilderDelegate<Saint>(
        itemBuilder: (context, item, index) => SaintItem(
          saint: item,
        ),
        firstPageErrorIndicatorBuilder: (_) => const SizedBox.shrink(),
        newPageErrorIndicatorBuilder: (_) => const SizedBox.shrink(),
        noItemsFoundIndicatorBuilder: (_) => const SizedBox.shrink(),
        noMoreItemsIndicatorBuilder: (_) => const SizedBox.shrink(),
        firstPageProgressIndicatorBuilder: (_) => const SizedBox.shrink(),
      )
  );
}