import 'package:app/models/datacovid.dart';
import 'package:app/repository/datacovidrepository.dart';
import 'package:flutter_riverpod/all.dart';

abstract class DataCovidState {
  const DataCovidState();
}

class DataCovidLoading extends DataCovidState {
  const DataCovidLoading();
}

class DataCovidLoaded extends DataCovidState {
  final DataCovidInfo dataCovid;
  const DataCovidLoaded(this.dataCovid);
}

class DataCovidError extends DataCovidState {
  final String message;
  const DataCovidError(this.message);
}

class DataCovidNotifier extends StateNotifier<DataCovidState> {
  final DataCovidRepository _dataCovidRepository;
  DataCovidNotifier(this._dataCovidRepository) : super(DataCovidLoading());

  Future<void> fetchDataCovid() async {
    try {
      final result = await _dataCovidRepository.fetchDataCovid();
      state = DataCovidLoaded(result);
    } catch (e) {
      state = DataCovidError('$e');
    }
  }
}
