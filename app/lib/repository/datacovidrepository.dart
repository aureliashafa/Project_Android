import 'package:app/models/datacovid.dart';
import 'package:app/service/service.dart';

abstract class DataCovidRepository {
  Future<DataCovidInfo> fetchDataCovid();
}

class DataCovidRepositorySub implements DataCovidRepository {
  @override
  Future<DataCovidInfo> fetchDataCovid() async {
    final result = await Service().listDataCovid();
    return result;
  }
}
