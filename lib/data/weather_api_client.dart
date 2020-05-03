import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherforecast/models/weather/weather.dart';

class WeatherApiClient {
  static const baseURL = "https://www.metaweather.com/api/location/";

  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async {
    final sehirURL = baseURL + "search/?query=" + sehirAdi;
    final gelencevap = await httpClient.get(sehirURL);
    if (gelencevap.statusCode != 200) {
      throw Exception("veri getirilemedi");
    }
    final gelenCevapJson= (jsonDecode(gelencevap.body)) as List;
    return gelenCevapJson[0]["woeid"];
  }

  Future<Weather> getWeather(int sehirID) async{
    final havaDurumuURL= baseURL+sehirID.toString();
    final havaDurumuGelenCevap = await httpClient.get(havaDurumuURL);
    if(havaDurumuGelenCevap.statusCode != 200){
      throw Exception("hava durumu getirilemedi");
    }
    final havaDurumuGelenCevapJSON= jsonDecode(havaDurumuGelenCevap.body);
    return Weather.fromJson(havaDurumuGelenCevapJSON);
  }


}
