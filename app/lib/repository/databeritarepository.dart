import 'package:app/models/beritamodels.dart';
import 'package:app/service/service.dart';

abstract class DataBeritaRepository {
  Future<DataBerita> fetchDataBerita();
}

class DataBeritaRepositorySub implements DataBeritaRepository {
  @override
  Future<DataBerita> fetchDataBerita() async {
    final result = await Service().listBerita();
    return result;
  }
}
