import 'dart:convert';
import 'dart:io';
import 'package:app/models/beritamodels.dart';
import 'package:app/models/datacovid.dart';
import 'package:http/http.dart' as http;

class Service {
  Future listDataCovid() async {
    http.Response response =
        await http.get("https://api.kawalcorona.com/indonesia/");
    if (response.statusCode == HttpStatus.ok) {
      return DataCovidInfo.fromJson(json.decode(response.body)[0]);
    }
  }

  Future listBerita() async {
    http.Response response = await http.get(
        "http://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=a5ad4d5a49d4404492745289034a0b44");
    if (response.statusCode == HttpStatus.ok) {
      return DataBerita.fromJson(json.decode(response.body));
    }
  }
}
