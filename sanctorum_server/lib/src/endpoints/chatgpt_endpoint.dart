import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:sanctorum_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';



class ChatgptEndpoint extends Endpoint {

  Future<ByteData> generateJsonlFile(Session session) async {
      var saints = await Saint.db.find(session);

      // Criar e escrever o arquivo JSONL
      List<Map<String, dynamic>> data = [];

      for(var saint in saints){
        data.add(
          {
            "custom_id": "${saint.id}", 
            "method": "POST", 
            "url": "/v1/chat/completions", 
            "body": {
              "model": "gpt-4o-mini-2024-07-18", 
              "messages": [
                {"role": "system", "content": "Você é um especialista em extração estruturada de dados. Você receberá um texto não estruturado contando sobre a vida de um Santo da igreja católica e deverá convertê-lo na estrutura fornecida traduzindo para português brasileiro se for necessário"},
                {"role": "user", "content": "Nome: ${saint.name}\n${saint.fullText}"}
              ],
              "response_format": {
                "type": "json_schema",
                "json_schema": {
                  "name": "saint_extraction",
                  "strict": true,
                  "schema": {
                    "type": "object",
                    "properties": {
                      "name": {
                        "type": "string",
                        "description": "O nome de nascimento do santo"
                      },
                      "religiousName": {
                        "type": [
                          "string",
                          "null"
                        ],
                        "description": "O nome religioso do santo, caso não tenha é null"
                      },
                      "gender": {
                        "type": [
                          "string",
                          "null"
                        ],
                        "description": "O sexo do santo, deve retornar em",
                        "enum": [
                          "M",
                          "F"
                        ]
                      },
                      "title": {
                        "type": [
                          "string",
                          "null"
                        ],
                        "description": "título dado ao santo"
                      },
                      "birth": {
                        "type": "object",
                        "description": "Dados do santo referente ao seu nascimento",
                        "properties": {
                          "period": {
                            "type": [
                              "array",
                              "null"
                            ],
                            "description": "Alguns santos não tem data exata de nascimento, então aqui podem ser colocadas datas possíveis do seu nascimento, data inicial e final do periodo possível, somente uma única data caso tenha a data exata, ou nada se não houver dados. Devem estar no formato yyyy/mm/dd com mm e dd sendo zero caso não existam dados para mês e dia",
                            "items": {
                              "type": "string",
                              "description": "A(s) data(s) que compreende(m) o nascimento do santo. Deve estar no formato yyyy/mm/dd com mm e dd sendo zero caso não existam dados para mês e dia"
                            }
                          },
                          "country": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "País de nascimento do santo se disponível e null caso não haja dados sobre o país"
                          },
                          "city": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "Cidade de nascimento do santo se disponível e null caso não haja dados sobre a cidade"
                          },
                          "details": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "Mais detalhes sobre o nascimento  se disponível e null caso não haja dados sobre os detalhes"
                          },
                          "correspondentActualCountry": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "As vezes algum santo nasceu muito tempo atrás e o país não corresponde a geografia atual, aqui deve ser colocado o país que corresponde atualmente"
                          }
                        },
                        "required": [
                          "period",
                          "country",
                          "city",
                          "details",
                          "correspondentActualCountry"
                        ],
                        "additionalProperties": false
                      },
                      "death": {
                        "type": "object",
                        "description": "Dados do santo referente ao seu falecimento",
                        "properties": {
                          "period": {
                            "type": [
                              "array",
                              "null"
                            ],
                            "description": "Alguns santos não tem data exata de falecimento, então aqui podem ser colocadas datas possíveis da sua morte, data inicial ou final do periodo possível, somente uma única data caso tenha a data exata, ou nada se não houver dados. Devem estar no formato yyyy/mm/dd com mm e dd sendo zero caso não existam dados para mês e dia",
                            "items": {
                              "type": "string",
                              "description": "A(s) data(s) que compreende(m) a da morte do santo. Deve estar no formato yyyy/mm/dd com mm e dd sendo zero caso não existam dados para mês e dia"
                            }
                          },
                          "country": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "País onde morreu o santo se disponível e null caso não haja dados sobre o país"
                          },
                          "city": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "Cidade de morte do santo se disponível e null caso não haja dados sobre a cidade"
                          },
                          "details": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "Mais detalhes sobre a morte do santo se disponível e null caso não haja dados sobre os detalhes"
                          },
                          "correspondentActualCountry": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "As vezes algum santo morreu muito tempo atrás e o país não corresponde a geografia atual, aqui deve ser colocado o país que corresponde atualmente"
                          },
                          "isMartir": {
                            "type": [
                              "boolean"
                            ],
                            "description": "Se o santo foi morto por causa de sua fé se não houver dados sobre deve ser false"
                          },
                          "causeOfdeath": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "Como este santo morreu  se disponível e null caso não haja dados sobre a causa da morte"
                          }
                        },
                        "required": [
                          "period",
                          "country",
                          "city",
                          "details",
                          "correspondentActualCountry",
                          "isMartir",
                          "causeOfdeath"
                        ],
                        "additionalProperties": false
                      },
                      "family": {
                        "type": "object",
                        "description": "Dados dos familiares do santo",
                        "properties": {
                          "father": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "Nome do pai do santo"
                          },
                          "mother": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "Nome da mãe do santo"
                          },
                          "numberOfSiblings": {
                            "type": [
                              "number",
                              "null"
                            ],
                            "description": "Quantidade de irmãos biologicos e adotados pelo pai e mãe"
                          }
                        },
                        "required": [
                          "father",
                          "mother",
                          "numberOfSiblings"
                        ],
                        "additionalProperties": false
                      },
                      "veneration": {
                        "type": "object",
                        "description": "Dados relacionados a veneração pelo santo",
                        "properties": {
                          "celebrationDate": {
                            "type": "array",
                            "description": "Dia(s) em que se celebra o santo, deve ter o formato dd/mm.",
                            "items": {
                              "type": "string",
                              "description": "Datas que compreendem aos dias em que se celebra o santo. deve ter o formato dd/mm."
                            }
                          },
                          "legacy": {
                            "type": [
                              "string",
                              "null"
                            ],
                            "description": "Qual o legado que este santo deixou para nós"
                          }
                        },
                        "required": [
                          "celebrationDate",
                          "legacy"
                        ],
                        "additionalProperties": false
                      },
                      "academicTraining": {
                        "type": [
                          "array",
                          "null"
                        ],
                        "description": "Formação academica do santo",
                        "items": {
                          "type": "string"
                        }
                      },
                      "ecclesiasticalHierarchy": {
                        "type": [
                          "array",
                          "null"
                        ],
                        "description": "Hierarquia do santo na vida cristã, por exemplo: Leigo, consagrado, padre, bispo, diacono, frei, freira, frade e etc.",
                        "items": {
                          "type": "object",
                          "properties": {
                            "hiearchyName": {
                              "type": "string",
                              "description": "nome dado a hierarquia Leigo, consagrado, padre, bispo, diacono, frei, freira, frade e etc."
                            },
                            "details": {
                              "type": [
                                "string",
                                "null"
                              ],
                              "description": "Mais detalhes importantes"
                            }
                          },
                          "required": [
                            "hiearchyName",
                            "details"
                          ],
                          "additionalProperties": false
                        }
                      },
                      "cononizationDate": {
                        "type": [
                          "string",
                          "null"
                        ],
                        "description": "A data da cononização do santo. Deve estar no formato yyyy/mm/dd com mm e dd sendo zero caso não existam dados"
                      },
                      "beatificationDate": {
                        "type": [
                          "string",
                          "null"
                        ],
                        "description": "A data da beatificação do santo. Deve estar no formato yyyy/mm/dd com mm e dd sendo zero caso não existam dados"
                      },
                      "religiousEvents": {
                        "type": [
                          "array",
                          "null"
                        ],
                        "description": "Eventos importantes da vida do santo, como ordenção, batismo etc. principalmente eventos religiosos e espirituais",
                        "items": {
                          "type": "object",
                          "properties": {
                            "year": {
                              "type": [
                                "number",
                                "null"
                              ],
                              "description": "Ano em que aconteceu o evento"
                            },
                            "event": {
                              "type": [
                                "string",
                                "null"
                              ],
                              "description": "Descrição do que foi o evento no pretérito perfeito do indicativo"
                            }
                          },
                          "required": [
                            "year",
                            "event"
                          ],
                          "additionalProperties": false
                        }
                      },
                      "miracles": {
                        "type": [
                          "array",
                          "null"
                        ],
                        "description": "Milagres feito por/pelo/para o santo, caso não tenha colocar null",
                        "items": {
                          "type": "object",
                          "properties": {
                            "miracleName": {
                              "type": "string",
                              "description": "Tipo do milagre, por exemplo: bilocação, cura, chagas e etc"
                            },
                            "details": {
                              "type": [
                                "string",
                                "null"
                              ],
                              "description": "Detalhes do milgare, onde como ocorreu e outros detalhes importantes"
                            }
                          },
                          "required": [
                            "miracleName",
                            "details"
                          ],
                          "additionalProperties": false
                        }
                      },
                      "quotations": {
                        "type": [
                          "array",
                          "null"
                        ],
                        "description": "Frases ditas ou escritas pelo santo, caso não tenha frases colocar null",
                        "items": {
                          "type": "object",
                          "properties": {
                            "quote": {
                              "type": "string",
                              "description": "Transcrição literal do que foi dito ou escrito"
                            },
                            "context": {
                              "type": [
                                "string",
                                "null"
                              ],
                              "description": "Contexto em que foi dita, para quem, onde, porque"
                            },
                            "reference": {
                              "type": [
                                "string",
                                "null"
                              ],
                              "description": "Dados precisos da onde está escrito ou onde foi dito: livro, pagina, ano, local"
                            }
                          },
                          "required": [
                            "quote",
                            "context",
                            "reference"
                          ],
                          "additionalProperties": false
                        }
                      },
                      "prayers": {
                        "type": [
                          "array",
                          "null"
                        ],
                        "description": "Oração ou orações feita pelo santo, ou que é rezada para/por ele",
                        "items": {
                          "type": "string"
                        }
                      },
                      "summary": {
                        "type": [
                          "string",
                          "null"
                        ],
                        "description": "Resumo médio do texto destacando caracteristicas da vida e religiosidade do santo"
                      }
                    },
                    "required": [
                      "name",
                      "religiousName",
                      "gender",
                      "title",
                      "birth",
                      "death",
                      "family",
                      "veneration",
                      "academicTraining",
                      "ecclesiasticalHierarchy",
                      "cononizationDate",
                      "beatificationDate",
                      "religiousEvents",
                      "miracles",
                      "quotations",
                      "prayers",
                      "summary"
                    ],
                    "additionalProperties": false
                  }
                }
              },
            }
          }
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
