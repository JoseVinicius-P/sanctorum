import 'package:sanctorum_client/sanctorum_client.dart';

class Details{
  String? country;
  String? correspondentActualCountry;
  String? city;
  String? details;

  Details(this.country, this.correspondentActualCountry, this.city, this.details);
}

extension DetailsBirth on Birth{
  void setDetails(Details? details){
    country = details?.country;
    city = details?.city;
    correspondentActualCountry = details?.correspondentActualCountry;
    this.details = details?.details;
  }

  Details get getDetails{
    return Details(country, correspondentActualCountry, city, this.details);
  }
}

extension DetailsDeath on Death{
  void setDetails(Details? details){
    country = details?.country;
    city = details?.city;
    correspondentActualCountry = details?.correspondentActualCountry;
    this.details = details?.details;
  }

  Details get getDetails{
    return Details(country, correspondentActualCountry, city, this.details);
  }
}