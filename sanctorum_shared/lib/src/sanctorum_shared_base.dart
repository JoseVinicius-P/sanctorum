
import 'dart:convert';

class Date{
  int year, month, day;

  Date.fromString(String date)
      : year = int.parse(date.split('/')[0]),
        month = int.parse(date.split('/')[1]),
        day = int.parse(date.split('/')[2]);

  @override
  String toString(){
    return "$year/$month/$day";
  }
}

class Birth {
  final List<Date>? period;
  final String? country, city, details, correspondentActualCountry;

  Birth({this.period, this.country, this.city, this.details, this.correspondentActualCountry});

  factory Birth.fromJson(Map<String, dynamic> json) {
    return Birth(
      period: (jsonDecode(json['period']) as List<String>).map((e) => Date.fromString(e)).toList(),
      city: json['city'],
      country: json['country'],
      details: json['details'],
      correspondentActualCountry: json['correspondentActualCountry']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "period" : period?.map((e) => e.toString()).toList(),
      "country": country,
      "city": city,
      "details": details,
      "correspondentActualCountry": correspondentActualCountry
    };
  }

  

}


/*{
   "birhName":"Nome de nascimento do santo",
   "religiousName": "Nome religioso do santo",
   "title":"Titulo dado ao santo",
   "birth": {
     "period": [
        "yyyy/mm/dd",
        "yyyy/mm/dd"
      ],
      "country": "País do nascimento",
      "city": "Cidade do nascimento",
      "details": "Mais detalhes do nascimento",
      "correspondentActualCountry": "País que corresponde atualmente"
   },
   "death":{
      "period": [
         "yyyy/mm/dd",
         "yyyy/mm/dd"
       ],
       "country": "País da morte",
       "city": "Cidade da morte",
       "correspondentActualCountry": "País que corresponde atualmente",
       "isMartir": true,
       "causeOfdeath": "Como o santo morreu",
       "details": "Mais detalhes da morte"
   },
   "family": {
    "father": "Nome do pai do santo",
    "mother": "Nome da mãe do santo",
    "numberOfSiblings": 0
  },
  "veneration": {
    "celebrationDate": "dd/mm",
    "legacy": "Legado deixado pelo santo para nós"
  },
  "academicTraining":[
      "nome da area de formação",
      "..."
  ],
  "ecclesiasticalHierarchy":[
    {
      "type": "Tipo da hieraquia, por exemplo: Leigo, consagrado, padre, bispo, diacono, frei, freira, frade e etc.",
      "details": "detalhes sobre o tipo"
    }
  ],
  "cononizationDate":"yyyy/mm/dd",
  "beatificationDate": "yyyy/mm/dd",
  "significantReligiousEvents": [
    {
      "year": "Ano do evento",
      "event": "Todos os eventos significativos da vida do santo não mencionados até aqui, como milagres, ordenção, batismo  etc. principalmente eventos religiosos e espirituais"
    }
  ],
  "miracles": [
    {
      "type": "Tipo do milagre, por exemplo: bilocação, cura, chagas e etc",
      "details": "Detalhes de como, onde e outras informações"
    }
  ],
  "quotations": [
    {
      "quote": "Palavras ditas ou escritas pelo santo",
      "context": "Contexto em que foi dita ou escrita"
    }
  ],
  "prayer":"Oração do santo",
  "abstract": "resumo pequeno do texto destacando carateristicas religiosas"
} */