import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:sanctorum_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';



class ChatgptEndpoint extends Endpoint {

  Future<ByteData> generateJsonlFile(Session session) async {
      var saints = await Saint.db.find(session, where: (e) => e.fullText.notEquals(null));

      // Criar e escrever o arquivo JSONL
      List<Map<String, dynamic>> data = [];

      for(var saint in saints){
        data.add(
          {"custom_id":"${saint.id}","method":"POST","url":"/v1/chat/completions","body":{"model":"gpt-4o-mini-2024-07-18","messages":[{"role":"system","content":"Você é um especialista em extração estruturada de dados. Você receberá um texto não estruturado contando sobre a vida de um Santo da igreja católica e deverá convertê-lo na estrutura fornecida traduzindo para português brasileiro se for necessário"},{"role":"user","content":"Nome: ${saint.name}\n${saint.fullText}"}],"response_format":{"type":"json_schema","json_schema":{"name":"saint_extraction","strict":true,"schema":{"type":"object","properties":{"name":{"type":"string","description":"O nome de nascimento do santo"},"religiousName":{"type":["string","null"],"description":"O nome religioso do santo, caso não tenha é null"},"gender":{"type":["string","null"],"description":"O sexo do santo, deve retornar em","enum":["M","F"]},"title":{"type":["string","null"],"description":"título dado ao santo. É padroeiro de quê?"},"birth":{"type":["object","null"],"description":"Dados do santo referente ao seu nascimento","properties":{"period":{"type":["array","null"],"description":"Alguns santos não tem data exata de nascimento, então aqui podem ser: as datas possíveis do seu nascimento, data inicial e final do periodo possível, somente uma única data caso tenha a data exata, ou null se não houver dados suficientes para determinar o ano. Devem estar no formato yyyy/mm/dd com mm e dd sendo zero caso não existam dados para mês e dia.","items":{"type":"string","description":"A(s) data(s) que compreende(m) o nascimento do santo. Deve estar no formato yyyy/mm/dd com mm e dd sendo zero caso não existam dados para mês e dia"}},"country":{"type":["string","null"],"description":"País de nascimento do santo se disponível e null caso não haja dados sobre o país"},"city":{"type":["string","null"],"description":"Cidade de nascimento do santo se disponível e null caso não haja dados sobre a cidade"},"details":{"type":["string","null"],"description":"Mais detalhes sobre o nascimento  se disponível e null caso não haja dados sobre os detalhes"},"correspondentActualCountry":{"type":["string","null"],"description":"As vezes algum santo nasceu muito tempo atrás e o país não corresponde a geografia atual, aqui deve ser colocado o país que corresponde atualmente"}},"required":["period","country","city","details","correspondentActualCountry"],"additionalProperties":false},"death":{"type":["object","null"],"description":"Dados do santo referente ao seu falecimento","properties":{"period":{"type":["array","null"],"description":"Aqui podem ser colocadas datas possíveis da morte do santo, pode ser: a data inicial ou final do periodo possível, somente uma única data caso tenha a data exata, ou null se não houver dados. Devem estar no formato yyyy/mm/dd com mm e dd sendo zero(0) caso não existam dados para mês e dia","items":{"type":"string","description":"A(s) data(s) que compreende(m) a da morte do santo. Deve estar no formato yyyy/mm/dd com mm e dd sendo zero(0) caso não existam dados para mês e dia"}},"country":{"type":["string","null"],"description":"País onde morreu o santo se disponível e null caso não haja dados sobre o país"},"city":{"type":["string","null"],"description":"Cidade de morte do santo se disponível e null caso não haja dados sobre a cidade"},"details":{"type":["string","null"],"description":"Mais detalhes sobre a morte do santo se disponível e null caso não haja dados sobre os detalhes"},"correspondentActualCountry":{"type":["string","null"],"description":"As vezes algum santo morreu muito tempo atrás e o país não corresponde a geografia atual, aqui deve ser colocado o país que corresponde atualmente"},"isMartir":{"type":["boolean"],"description":"Se o santo foi morto por causa de sua fé se não houver dados sobre deve ser false"},"causeOfdeath":{"type":["string","null"],"description":"Como este santo morreu  se disponível e null caso não haja dados sobre a causa da morte"}},"required":["period","country","city","details","correspondentActualCountry","isMartir","causeOfdeath"],"additionalProperties":false},"family":{"type":["object","null"],"description":"Dados dos familiares do santo","properties":{"father":{"type":["string","null"],"description":"Nome do pai do santo"},"mother":{"type":["string","null"],"description":"Nome da mãe do santo"},"numberOfSiblings":{"type":["number","null"],"description":"Quantidade de irmãos biologicos e adotados pelo pai e mãe"}},"required":["father","mother","numberOfSiblings"],"additionalProperties":false},"veneration":{"type":["object",null],"description":"Dados relacionados a veneração pelo santo","properties":{"celebrationDate":{"type":"array","description":"Dia(s) em que se celebra o santo, deve ter o formato dd/mm.","items":{"type":"string","description":"Datas que compreendem aos dias em que se celebra o santo. deve ter o formato dd/mm."}},"legacy":{"type":["string","null"],"description":"Qual o legado que este santo deixou para nós"}},"required":["celebrationDate","legacy"],"additionalProperties":false},"academicTraining":{"type":["array","null"],"description":"Formação academica do santo","items":{"type":"string"}},"ecclesiasticalHierarchy":{"type":["array","null"],"description":"Hierarquia do santo na vida cristã, por exemplo: Leigo, consagrado, padre, bispo, diacono, frei, freira, frade e etc.","items":{"type":"object","properties":{"hiearchyName":{"type":"string","description":"nome dado a hierarquia Leigo, consagrado, padre, bispo, diacono, frei, freira, frade e etc."},"details":{"type":["string","null"],"description":"Mais detalhes importantes"}},"required":["hiearchyName","details"],"additionalProperties":false}},"cononizationDate":{"type":["string","null"],"description":"A data da cononização do santo. Deve estar no formato yyyy/mm/dd com mm e dd sendo zero caso não existam dados"},"beatificationDate":{"type":["string","null"],"description":"A data da beatificação do santo. Deve estar no formato yyyy/mm/dd com mm e dd sendo zero caso não existam dados"},"religiousEvents":{"type":["array","null"],"description":"Eventos importantes da vida do santo, como ordenção, batismo etc. principalmente eventos religiosos e espirituais","items":{"type":"object","properties":{"year":{"type":["number","null"],"description":"Ano em que aconteceu o evento"},"event":{"type":["string","null"],"description":"Descrição do que foi o evento no pretérito perfeito do indicativo"}},"required":["year","event"],"additionalProperties":false}},"miracles":{"type":["array","null"],"description":"Milagres feito por/pelo/para o santo, caso não tenha colocar null","items":{"type":"object","properties":{"miracleName":{"type":"string","description":"Tipo do milagre, por exemplo: bilocação, cura, chagas e etc"},"details":{"type":["string","null"],"description":"Detalhes do milgare, onde como ocorreu e outros detalhes importantes"}},"required":["miracleName","details"],"additionalProperties":false}},"quotations":{"type":["array","null"],"description":"Citações de texto ou de fala dita ou escrita pelo santo","items":{"type":"object","properties":{"quote":{"type":"string","description":"Transcrição literal do que foi dito ou escrito"},"context":{"type":["string","null"],"description":"Contexto em que foi dita, para quem, onde, porque"},"reference":{"type":["string","null"],"description":"Dados precisos da onde está escrito ou onde foi dito: livro, pagina, ano, local"}},"required":["quote","context","reference"],"additionalProperties":false}},"prayers":{"type":["array","null"],"description":"Oração ou orações feita pelo santo, ou que é rezada para/por ele","items":{"type":"string"}},"summary":{"type":["string","null"],"description":"Resumo médio do texto destacando caracteristicas da vida e religiosidade do santo"}},"required":["name","religiousName","gender","title","birth","death","family","veneration","academicTraining","ecclesiasticalHierarchy","cononizationDate","beatificationDate","religiousEvents","miracles","quotations","prayers","summary"],"additionalProperties":false}}}}}
        );
      }

      final file = File('saints.jsonl');
      final sink = file.openWrite();

      for (var item in data) {
        sink.writeln(jsonEncode(item));
      }
      await sink.close();

      // Ler o arquivo como ByteData
      ByteData byteData = await file.readAsBytes().then((bytes) => ByteData.sublistView(Uint8List.fromList(bytes)));
      
      return byteData;
  }

  Future<String> uploadJsonlChatGptOutput(Session session, ByteData byteData) async {
    try{

      // Converte ByteData para Uint8List
      Uint8List bytes = byteData.buffer.asUint8List();

      // Converte Uint8List para String
      String jsonString = utf8.decode(bytes);

      // Processa o conteúdo do JSONL
      List<String> lines = jsonString.split('\n');

      for(var line in lines){
        if(line.isNotEmpty){
          var fullJson = jsonDecode(line);
          var saintJson = jsonDecode(fullJson['response']['body']['choices'][0]['message']['content']);
          int id = int.parse(fullJson['custom_id']);
          var saint = await Saint.db.findById(session, id);
          print("Entrou aqui");
          if(saint != null 
            && saint.birthId == null 
            && saint.deathId == null 
            && saint.title == null
            && saint.religiousName == null
            && saint.familyId == null
            && saint.venerationId == null
            && saint.academicTraining == null
            && saint.cononizationDate == null
            && saint.beatificationDate == null
            && saint.prayers == null
            && saint.summary == null
            && saint.gender == null
          ){
              saint = saintfromGptJson(saintJson, saint);
              //Aqui não se deve atualizar a variavel santo, por perdesse os objetos que serão usado a seguir
              await Saint.db.updateRow(session, saint);
              await session.db.transaction((transaction) async {
                if(saint?.birth != null && 
                (saint?.birth?.city != null || 
                saint?.birth?.correspondentActualCountry != null || 
                saint?.birth?.country != null || 
                saint?.birth?.details != null || 
                (saint?.birth?.period != null && saint!.birth!.period!.isNotEmpty) 
                )){
                  var birth = await Birth.db.insertRow(session, saint!.birth!);
                  await Saint.db.attachRow.birth(session, saint!, birth);
                  print("Inserindo nascimento: ${birth.id}");
                }
                if(saint?.death != null &&
                  (saint?.death?.city != null || 
                  saint?.death?.correspondentActualCountry != null || 
                  saint?.death?.country != null || 
                  saint?.death?.details != null ||
                  saint?.death?.causeOfdeath != null ||
                  saint?.death?.isMartir != null || 
                  (saint?.death?.period != null && saint!.death!.period!.isNotEmpty) 
                )){
                  var death = await Death.db.insertRow(session, saint!.death!);
                  await Saint.db.attachRow.death(session, saint!, death);
                  print("Inserindo falecimento: ${death.country}");
                }
                if(saint?.family != null && (
                  saint?.family?.father != null ||
                  saint?.family?.mother != null ||
                  saint?.family?.numberOfSiblings != null
                )){
                  var family = await Family.db.insertRow(session, saint!.family!);
                  await Saint.db.attachRow.family(session, saint!, family);
                  print("Inserindo família: ${family.father}");
                }
                if(saint?.veneration != null && 
                  ((saint?.veneration?.celebrationDate != null && saint!.veneration!.celebrationDate!.isNotEmpty) ||
                  saint!.veneration!.legacy != null
                )){
                  var veneration = await Veneration.db.insertRow(session, saint!.veneration!);
                  await Saint.db.attachRow.veneration(session, saint!, veneration);
                  print("Inserindo veneração: ${veneration.legacy}");
                }
                if(saint?.ecclesiasticalHierarchy != null && saint!.ecclesiasticalHierarchy!.isNotEmpty){
                  var ecclesiasticalHierarchy = await EcclesiasticalHierarchy.db.insert(session, saint.ecclesiasticalHierarchy!);
                  await Saint.db.attach.ecclesiasticalHierarchy(session, saint, ecclesiasticalHierarchy);
                }
                if(saint?.religiousEvents != null && saint!.religiousEvents!.isNotEmpty){
                  var religiousEvents = await ReligiousEvent.db.insert(session, saint.religiousEvents!);
                  await Saint.db.attach.religiousEvents(session, saint, religiousEvents);
                }
                if(saint?.miracles != null && saint!.miracles!.isNotEmpty){
                  var miracles = await Miracle.db.insert(session, saint.miracles!);
                  await Saint.db.attach.miracles(session, saint, miracles);
                }
                if(saint?.quotations != null && saint!.quotations!.isNotEmpty){
                  var quotations = await Quotation.db.insert(session, saint.quotations!);
                  await Saint.db.attach.quotations(session, saint, quotations);
                }
                
              });
          }
        } 
      }

    }catch(e, s){
      print("Erro: $e, $s");
    }
      return "Dados dos santos inseridos com sucesso";
  }

  Saint saintfromGptJson(Map<String, dynamic> json, Saint saint){
    saint.name = json['name'];
    saint.religiousName = json['religiousName'];
    saint.gender = json['gender'];
    saint.title = json['title'];
    saint.birth = json['birth'] != null ? Birth(
        period: json['birth']['period'] != null && (json['birth']['period'] as List).isNotEmpty ? (json['birth']['period'] as List).map((e){
          List<String> date = e.split('/');
          try{
            return Date(
            year: int.parse(date[0]),
            month: int.parse(date[1]),
            day: int.parse(date[2]),
          );
          }catch(e){
            return null;
          }
        }).whereType<Date>().toList() : null,
        country: json['birth']['country'],
        city: json['birth']['city'],
        details: json['birth']['details'],
        correspondentActualCountry: json['birth']['correspondentActualCountry']
      ) : null;
    saint.death = json['death'] != null ? Death(
        period: json['death']['period'] != null && (json['death']['period'] as List).isNotEmpty ? (json['death']['period'] as List).map((e){
          List<String> date = e.split('/');
          try{
            return Date(
            year: int.parse(date[0]),
            month: int.parse(date[1]),
            day: int.parse(date[2]),
          );
          }catch(e){
            return null;
          }
        }).whereType<Date>().toList() : null,
        country: json['death']['country'],
        city: json['death']['city'],
        details: json['death']['details'],
        correspondentActualCountry: json['death']['correspondentActualCountry'],
        isMartir: json['death']['isMartir'],
        causeOfdeath: json['death']['causeOfdeath'],
      ) : null;
    saint.family = json['family'] != null ? Family(
        father: json['family']['father'],
        mother: json['family']['mother'],
        numberOfSiblings: json['family']['numberOfSiblings'],
      ) : null;
    saint.veneration = json['veneration'] != null ? Veneration(
        celebrationDate: json['veneration']['celebrationDate'] != null && (json['veneration']['celebrationDate'] as List).isNotEmpty ? 
        (json['veneration']['celebrationDate'] as List).map((e) => e.toString()).toList() 
        : null,
        legacy: json['veneration']['legacy'],
      ) : null;
    saint.academicTraining = json['academicTraining'] != null && (json['academicTraining'] as List).isNotEmpty ? (json['academicTraining'] as List).map((e)=>e.toString()).toList() : null;
    saint.ecclesiasticalHierarchy = json['ecclesiasticalHierarchy'] != null && (json['ecclesiasticalHierarchy'] as List).isNotEmpty ? 
      (json['ecclesiasticalHierarchy'] as List).map((e){
        return EcclesiasticalHierarchy(
          hiearchyName: e['hiearchyName'],
          details: e['details']
        );
      }).toList() : null;
    saint.cononizationDate = json['cononizationDate'] != null
        ? (() {
            try {
              List<String> dateParts = json['cononizationDate'].split('/');
              int year = int.parse(dateParts[0]);
              int month = int.parse(dateParts[1]);
              int day = int.parse(dateParts[2]);
              return Date(
                year: year,
                month: month,
                day: day,
              );
            } catch (e) {
              // Se houver um erro durante a conversão, retornar null
              return null;
            }
          })()
        : null;
    saint.beatificationDate = json['beatificationDate'] != null
        ? (() {
            try {
              List<String> dateParts = json['beatificationDate'].split('/');
              int year = int.parse(dateParts[0]);
              int month = int.parse(dateParts[1]);
              int day = int.parse(dateParts[2]);
              return Date(
                year: year,
                month: month,
                day: day,
              );
            } catch (e) {
              // Se houver um erro durante a conversão, retornar null
              return null;
            }
          })()
        : null;
    saint.religiousEvents = json['religiousEvents'] != null && (json['religiousEvents'] as List).isNotEmpty ? (json['religiousEvents'] as List).map((e){
        return ReligiousEvent(
          year: e['year'],
          event: e['event']
        );
      }).toList() : null;
    saint.miracles = json['miracles'] != null && (json['miracles'] as List).isNotEmpty ? (json['miracles'] as List).map((e){
        return Miracle(
          name: e['miracleName'],
          details: e['details']
        );
      }).toList() : null;
    saint.quotations = json['quotations'] != null && (json['quotations'] as List).isNotEmpty ? (json['quotations'] as List).map((e){
        return Quotation(
          quote: e['quote'],
          context: e['context'],
          reference: e['reference'],
        );
      }).toList() : null;
    saint.prayers = json['prayers'] != null && (json['prayers'] as List).isNotEmpty ? (json['prayers'] as List).map((e) => e.toString()).toList() : null;
    saint.summary = json['summary'];

    return saint;
  }

  int wordsLength(String text){
    List<String> words = text
      .replaceAll(RegExp(r'[^\w\s]'), ' ')  // Substitui pontuação por espaço
      .split(RegExp(r'\s+'))                // Divide em palavras usando espaços
      .where((palavra) => palavra.isNotEmpty)  // Remove palavras vazias
      .toList();

      for(var word in words){
        print(word);
      }
      

      return words.length;
  }
}
