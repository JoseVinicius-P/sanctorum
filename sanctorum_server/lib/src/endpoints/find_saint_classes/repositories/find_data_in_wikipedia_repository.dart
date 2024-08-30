import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/find_data_service.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class FindDataInWikipediaRepository {
  final FindDataService findDataService;

  FindDataInWikipediaRepository(this.findDataService);

  Future<List<Map<String, String>>?> getLinksOfSaints(String url) async {
    var response = await findDataService.dataOfSite(url);
    if (response.statusCode == 200) {
      return _getLinksInWikpediaHtml(reponseToDocument(response.body));
    } else {
      return null;
    }
  }

  Future<String> getHtml(String url) async {
    var response = await findDataService.dataOfSite(url);
    String compactHtml = response.body
        .replaceAll(RegExp(r'>\s+<'), '><') // Remove espaços entre tags
        .replaceAll(RegExp(r'\s+(?=<)'),
            '') // Remove espaços antes de uma tag de fechamento
        .replaceAll(RegExp(r'(?<=\>)\s+'),
            '') // Remove espaços depois de uma tag de abertura
        .replaceAll(RegExp(r'\s{2,}'),
            ' '); // Reduz múltiplos espaços consecutivos a um único
    return compactHtml;
  }

  dom.Document reponseToDocument(String stringHtml) {
    try {
      var document = parser.parse(stringHtml);
      return document;
    } catch (e) {
      throw ('Erro $e');
    }
  }

  Future<String?> getFullTextOfSaint(String stringHtml) async {
    var part1 = _getFullTextInWikpediaHtml(reponseToDocument(stringHtml));
    var part2 = _getTableTextInWikipediaHtml(reponseToDocument(stringHtml));
    var text = "${part1 ?? ''}\n${part2 ?? ''}".trim();
    return text.isNotEmpty ? text : null;
  }

  Future<String?> getImageLink(String stringHtml) async {
    return _getImageUrlInWikipediaHtml(reponseToDocument(stringHtml));
  }

  String? _getImageUrlInWikipediaHtml(dom.Document document) {
    // Selecionar a primeira tag <meta> com o atributo property="og:image"
    var metaTag = document.querySelector('meta[property="og:image"]');

    return metaTag?.attributes['content'];
  }

  String? _getTableTextInWikipediaHtml(dom.Document document) {
    // Selecionar a tabela pela classe "infobox infobox_v2"
    var table = document.querySelector('table.infobox.infobox_v2');

    // Verificar se a tabela foi encontrada
    if (table != null) {
      // Inicializar uma string para armazenar todo o texto da tabela
      String tableText = '';

      // Selecionar todas as células de cabeçalho (th) e dados (td)
      var cells = table.querySelectorAll('th, td');

      // Iterar sobre as células e concatenar o texto
      for (var cell in cells) {
        if (cell != cells.last) {
          tableText += '${_getFormattedText(cell)}\n';
        }
      }

      return tableText.trim();
    } else {
      return null;
    }
  }

  String? _getFullTextInWikpediaHtml(dom.Document document) {
    var pElements = document.querySelectorAll('p');

    String text = '';

    for (var p in pElements) {
      text += '${_getFormattedText(p)}\n';
    }

    return text.isEmpty ||
            text.contains(
                'A Wikipédia não possui um artigo com este nome exato') ||
            text.contains(
                'O editor será agora carregado. Se continuar a ver esta mensagem após alguns segundos,atualize a página, por favor.')
        ? null
        : text.trim();
  }

  String _getFormattedText(dom.Element element) {
    StringBuffer buffer = StringBuffer();

    for (var node in element.nodes) {
      if (node is dom.Element) {
        buffer.write(_getFormattedText(node));
      } else if (node is dom.Text) {
        buffer.write(" ${node.text} ");
      }
    }

    String text = buffer.toString();

    // Remove os espaços antes dos sinais de pontuação especificados
    text = text.replaceAllMapped(RegExp(r'\s+([.,!?)\]}:;])'), (Match match) {
      return match.group(1)!;
    });

    // Remove os espaços após sinais de pontuação, exceto se estiver no final da string
    text = text.replaceAllMapped(RegExp(r'([(\[{])\s+(?=\S)'), (Match match) {
      return match.group(1)!;
    });

    return text.replaceAll(RegExp(r'(\s)+'), ' ');
  }

  List<Map<String, String>> _getLinksInWikpediaHtml(dom.Document document) {
    // Selecionar todas as linhas de tabela
    var rows = document.querySelectorAll('tr');

    // Iterar sobre as linhas
    List<Map<String, String>> links = [];
    for (var row in rows) {
      // Obter todos os <td> da linha
      var tdElements = row.querySelectorAll('td');

      // Verificar se o último <td> contém "Sim"
      if (tdElements.isNotEmpty && tdElements.last.text.trim() == 'Sim') {
        // Encontrar a tag <a> dentro do primeiro <td>
        var aTag = tdElements.first.querySelector('a');

        // Verificar se a tag <a> foi encontrada e extrair o link
        if (aTag != null) {
          String? href = aTag.attributes['href'];
          String? name = aTag.text;

          if (href != null && !href.contains('http')) {
            links.add({'name': name, 'link': href});
          }
        } else {}
      }
    }

    return links;
  }
}
