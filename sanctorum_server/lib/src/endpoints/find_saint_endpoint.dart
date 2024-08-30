import 'dart:math';

import 'package:sanctorum_server/src/endpoints/find_saint_classes/repositories/find_data_in_vatican_repository.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/repositories/find_data_in_wikipedia_repository.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/repositories/image_repository.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/find_data_service.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/image_service.dart';
import 'package:sanctorum_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class FindSaintEndpoint extends Endpoint {
  var findWikipediaDataRepository =
      FindDataInWikipediaRepository(FindDataService());
  var imageRepository = ImageRepository(ImageService());

  var findDataInVaticanRepository =
      FindDataInVaticanRepository(FindDataService());

  Future<String> findSaintsWikipedia(Session session) async {
    try {
      var namesAndLinks = await findWikipediaDataRepository
          .getLinksOfSaints('https://pt.wikipedia.org/wiki/Lista_de_santos');

      if (namesAndLinks != null && namesAndLinks.isNotEmpty) {
        for (var nameAndLink in namesAndLinks) {
          var stopwatch = Stopwatch()..start();
          await buildSaintWikipedia(nameAndLink, session);
          stopwatch.stop();
          print(
              "Gerado em ${stopwatch.elapsedMilliseconds} milisegundos (${namesAndLinks.indexOf(nameAndLink) + 1}/${namesAndLinks.length})");
          // Gera um número aleatório entre 2.0 e 5.0 com casas decimais
          double randomValue = (1 + Random().nextDouble() * 1) * 1000;
          if (stopwatch.elapsedMilliseconds < randomValue) {
            print(
                "Esperando ${(randomValue - stopwatch.elapsedMilliseconds).round()} milisegundos");
            await Future.delayed(Duration(
                milliseconds:
                    randomValue.round() - stopwatch.elapsedMilliseconds));
          }
        }

        return 'Finalizado!';
      }

      return 'Deu erro';
    } catch (e, s) {
      // Em caso de erro, lança uma exceção
      session.log('Erro ao acessar a URL: $e, $s');
      throw Exception('Erro ao acessar a URL');
    }
  }

  Future<String> updateFullTextsFromSavedWikipediaHtmls(Session session) async {
    var saints = await Saint.db.find(session);
    for (var saint in saints) {
      print(
          "Atualizando texto de ${saint.name} (${saints.indexOf(saint)}/${saints.length})");
      saint.fullText = await findWikipediaDataRepository
          .getFullTextOfSaint(saint.sourceHtml!);
      if (saint.fullText == "${saint.name} pode referir-se a:") {
        saint.fullText = null;
      }
      saint = await Saint.db.updateRow(session, saint);
      print(saint.fullText);
    }

    return "Atualizado com sucesso";
  }

  Future<void> buildSaintWikipedia(
      Map<String, String> namesAndLink, Session session) async {
    const red = '\x1B[31m'; // Código para cor vermelha
    const reset = '\x1B[0m'; // Código para resetar a cor

    var linkAux = "https://pt.wikipedia.org${namesAndLink['link']}";

    print(
        "$red Verificando santo (${namesAndLink['name']}, ${namesAndLink['link']}) ========================= $reset");
    var saints = await Saint.db.find(session,
        where: ((s) =>
            s.sourceLink.equals(linkAux) &
            s.name.equals(namesAndLink['name'])));

    if (saints.isEmpty) {
      var saintEqualsLink = await Saint.db
          .find(session, where: ((s) => s.sourceLink.equals(linkAux)));
      if (saintEqualsLink.isNotEmpty) {
        print("$red- Algum santo com o mesmo link $reset");
      }
      print("- Gerando Santo.......");
      print("- Buscando recurso html......");
      var html = await findWikipediaDataRepository.getHtml(linkAux);

      print("- Extraindo texto completo.....");
      var fullText = await findWikipediaDataRepository.getFullTextOfSaint(html);
      if (fullText == null) {
        print('$red- Texto completo não disponível! $reset');
      }

      print("- Salvando no banco de dados....");
      var saint = Saint(
          sourceHtml: html,
          sourceLink: linkAux,
          fullText: fullText,
          name: namesAndLink['name']);
      saint = await Saint.db.insertRow(session, saint);

      print("- Extraindo link da imagem...");
      var urlImage = await findWikipediaDataRepository.getImageLink(html);

      if (urlImage != null && saint.id != null) {
        print("- Salvando imagem e obtendo url publica..");
        String? imageUrl =
            await imageRepository.saveImage(urlImage, saint.id!, session);
        saint.urlImage = imageUrl;

        print("- Inserindo url no banco.");
        saint = await Saint.db.updateRow(session, saint);
      } else {
        print("$red- Link de imagem não disponível! $reset");
      }
    } else {
      print("$red- Santo ja existe no banco de dados! $reset");
    }

    print(
        "$red ====================================================================  $reset");
  }

  Future<void> findSaintsVatican(Session session) async {
    var namesAndLinks = await findDataInVaticanRepository.getLinksOfSaints(
        'https://www.vatican.va/news_services/liturgy/saints/index_saints_en.html');

    if (namesAndLinks != null && namesAndLinks.isNotEmpty) {
      for (var nameAndLink in namesAndLinks) {
        print(nameAndLink);
      }
    }
  }
}
