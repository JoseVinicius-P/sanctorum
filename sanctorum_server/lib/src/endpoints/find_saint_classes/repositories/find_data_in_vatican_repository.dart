import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/find_data_service.dart';
import 'package:html/dom.dart' as dom;

class FindDataInVaticanRepository {
  final FindDataService findDataService;

  FindDataInVaticanRepository(this.findDataService);

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
