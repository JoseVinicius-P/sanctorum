import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/find_data_service.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class FindDataInVaticanRepository {
  final FindDataService findDataService;

  FindDataInVaticanRepository(this.findDataService);

  Future<List<Map<String, String>>?> getLinksOfSaints(String url) async {
    var response = await findDataService.dataOfSite(url);
    if (response.statusCode == 200) {
      return _getLinksInVaticanHtml(responseToDocument(response.body));
    } else {
      return null;
    }
  }

  dom.Document responseToDocument(String stringHtml) {
    try {
      var document = parser.parse(stringHtml);
      return document;
    } catch (e) {
      throw ('Erro $e');
    }
  }

  List<Map<String, String>> _getLinksInVaticanHtml(dom.Document document) {
    // Seleciona todos os elementos <li> que representam santos
    var saintElements = document.querySelectorAll('li');

    List<Map<String, String>> links = [];

    for (var saint in saintElements) {
      // Pega o nome do santo
      var saintNameElement = saint.querySelector('b > i');
      var saintName = saintNameElement?.text.trim() ?? '';

      // Pega o link da foto
      var photoLinkElement = saint.querySelector('a[href*="photo"]');
      var photoLink = photoLinkElement?.attributes['href'] ?? '';

      // Pega os links das biografias
      var biographyLinkElements = saint.querySelectorAll('a[href*="bio"]');
      String biographyLinks = biographyLinkElements.map((element) {
        return element.attributes['href'] ?? '';
      }).join(', ');

      // Adiciona as informações à lista de links
      links.add({
        'name': saintName,
        'photo': photoLink,
        'biographies': biographyLinks,
      });
    }

    print(links);

    return links;
  }
}
