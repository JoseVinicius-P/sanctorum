import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class FindDataService{

  Future<Response> dataOfSite(String url) async {
      return await http.get(Uri.parse(url));
  }
}