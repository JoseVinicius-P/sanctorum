import 'package:html/parser.dart' as htmlparser;
import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/find_data_service.dart';
import 'package:html/dom.dart' as dom;

class FindDataInVaticanRepository {
  final FindDataService findDataService;

  FindDataInVaticanRepository(this.findDataService);

  Future<List<Map<String, String>>?> getSaintLinks(String url) async {
    final response = await findDataService.dataOfSite(url);
    if (response.statusCode != 200) {
      // Em caso de falha na requisição, retorna uma lista vazia
      return [];
    }

    try {
      final document = _parseHtml(response.body);
      return _extractSaintLinks(document);
    } catch (e) {
      // Em caso de erro durante o processamento, lança uma exceção com a mensagem apropriada
      throw Exception('Erro ao processar o HTML: $e');
    }
  }

  dom.Document _parseHtml(String htmlContent) {
    return htmlparser.parse(htmlContent);
  }

  List<Map<String, String>> _extractSaintLinks(dom.Document document) {
    // Seleciona todos os elementos <li> que representam santos
    final saintsElements = document.querySelectorAll('li');

    return saintsElements.map((element) {
      final saintName = _extractSaintName(element);
      final photoLink = _extractPhotoLink(element);
      final biographies = _extractBiographyLinks(element);

      return {
        'name': saintName,
        'photo': photoLink,
        'biographies': biographies,
      };
    }).toList();
  }

  String _extractSaintName(dom.Element element) {
    final nameElement = element.querySelector('b > i');
    return nameElement?.text.trim() ?? 'Nome não disponível';
  }

  String _extractPhotoLink(dom.Element element) {
    final photoElement = element.querySelector('a[href*="photo"]');
    return photoElement?.attributes['href'] ?? 'Link de foto não disponível';
  }

  String _extractBiographyLinks(dom.Element element) {
    final biographyElements = element.querySelectorAll('a[href*="bio"]');
    return biographyElements.map((e) => e.attributes['href'] ?? '').join(', ');
  }
}
