import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/find_data_service.dart';
import 'package:html/dom.dart' as dom;

class FindDataInVaticanRepository {
  final FindDataService findDataService;

  FindDataInVaticanRepository(this.findDataService);

  List<Map<String, String>> _getLinksInVaticanHtml(dom.Document document) {
    var rows = document.querySelectorAll('tr');

    List<Map<String, String>> links = [];

    return links;
  }
}
