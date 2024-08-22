import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

class ImageService{

 
  Future<ByteData?> downloadImage(String imageUrl, String savePath) async {
    final response = await http.get(Uri.parse(imageUrl));

    if(response.statusCode == 200){
       // Converte o corpo da resposta em Uint8List
      Uint8List bytes = response.bodyBytes;
      
      // Converte Uint8List em ByteData
      return ByteData.sublistView(bytes);
    }else{
      return null;
    }
  }

  Future<String?> saveImageOnServer(String imageUrl, int saintId, Session session) async {

  
    final imageName = "1.${imageUrl.split('/').last.split('.').last}";
    final savePath = 'public/saints/$saintId/$imageName'; // Caminho no servidor
    
    try {
      final byteData = await downloadImage(imageUrl, savePath);
      if(byteData != null){
        await session.storage.storeFile(storageId: 'public', path: savePath, byteData: byteData);

        var exists = await session.storage.fileExists(storageId: 'public',path: savePath,);

        if(exists){
          var url = await session.storage.getPublicUrl(storageId: 'public',path: savePath);
          if(url != null){
            return '${url.path}?${url.query}';
          }else{
            return null;
          }
          
        }else{
          return null;
        }
      }else{
        return null;
      }
      
  
    } catch (e) {
      return null;
    }

    
  }

}