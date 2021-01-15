class DataCovidInfo {
  final String name;
  final String positif;
  final String sembuh;
  final String meninggal;
  final String dirawat;

  DataCovidInfo(
      {this.name, this.positif, this.sembuh, this.meninggal, this.dirawat});

  factory DataCovidInfo.fromJson(Map<String, dynamic> parsedJson) {
    return DataCovidInfo(
        name: parsedJson['name'],
        positif: parsedJson['positif'],
        sembuh: parsedJson['sembuh'],
        meninggal: parsedJson['meninggal'],
        dirawat: parsedJson['dirawat']);
  }
}
