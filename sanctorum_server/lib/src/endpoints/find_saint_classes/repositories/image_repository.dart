import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/image_service.dart';
import 'package:serverpod/serverpod.dart';

class ImageRepository{
  final ImageService service;

  ImageRepository(this.service);

  Future<String?> saveImage(String url, int saintId, Session session) async {
    return await service.saveImageOnServer(url, saintId, session);
  }
}