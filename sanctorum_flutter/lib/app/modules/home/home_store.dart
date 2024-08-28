import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/main.dart';

class HomeStore extends Store<List<Saint>> implements Disposable{
  HomeStore() : super([]) {
    initPageListeners();
  }

  final PagingController<int, Saint> pagingController = PagingController(firstPageKey: 1);

  @override
  Triple<List<Saint>> middleware(Triple<List<Saint>> newTriple) {
    updateSaints(newTriple.state, pagingController);
    return super.middleware(newTriple);
  }

  @override
  void dispose() {
    pagingController.dispose();
  }

  void initPageListeners(){
    pagingController.addPageRequestListener(fetchAllSaints);
  }

  void updateSaints(List<Saint> saints, PagingController pagingController){

    bool lastPage = saints.length % 30 != 0 || saints.isEmpty;

    if(pagingController.value.nextPageKey != null){
      lastPage = lastPage || !(saints.length > (pagingController.value.nextPageKey - 1) * 30);
    }

    pagingController.value = PagingState<int, Saint>(
      nextPageKey: lastPage ? null : (saints.length/30).floor() + 1,
      itemList: saints,
    );
  }

  void fetchAllSaints(int page) async {
    var saints = await client.saint.allSaints(page);
    state.addAll(saints);
    update(state, force: true);
  }

  void searchSaint(String query) async {
    update([]);
    var saints = await client.saint.search(query);

    update(saints);
  }
}